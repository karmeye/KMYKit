//
//  KMYAsynchronousOperation.m
//  KMYKit
//
//  Created on 22/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYAsynchronousOperation.h"
#include <libkern/OSAtomic.h>
#import "KMYDispatch.h"
#import "KMYAssert.h"

@interface KMYAsynchronousOperation ()
@end

@implementation KMYAsynchronousOperation {

    KMYAsynchronousOperationSynchronousExecutionBlock   _syncExecutionBlock;
    KMYAsynchronousOperationAsynchronousExecutionBlock  _asyncExecutionBlock;
    KMYAsynchronousOperationResultBlock                 _resultBlock;

    dispatch_queue_t                                    _resultCallbackQueue;

    // From docs: Your executing property must also provide the status in a thread-safe manner.
    OSSpinLock  _isExecutingLock;
    OSSpinLock  _isFinishedLock;

    BOOL        _isExecuting;
    BOOL        _isFinished;
}

- (instancetype)init {
    self = [super init];

    _isExecutingLock = OS_SPINLOCK_INIT;
    _isFinishedLock = OS_SPINLOCK_INIT;

    return self;
}

- (instancetype)initWithSynchronousExecutionBlock:(KMYAsynchronousOperationSynchronousExecutionBlock)executionBlock {
    self = [self init];
    _syncExecutionBlock = [executionBlock copy];
    return self;
}

- (instancetype)initWithSynchronousExecutionBlock:(KMYAsynchronousOperationSynchronousExecutionBlock)executionBlock
                                      resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
                              resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue {
    self = [self initWithSynchronousExecutionBlock:executionBlock];
    [self setResultBlock:resultBlock resultCallbackQueue:resultCallbackQueue];
    return self;
}

- (instancetype)initWithAsynchronousExecutionBlock:(KMYAsynchronousOperationAsynchronousExecutionBlock)executionBlock {
    self = [self init];
    _asyncExecutionBlock = [executionBlock copy];
    return self;
}

- (instancetype)initWithAsynchronousExecutionBlock:(KMYAsynchronousOperationAsynchronousExecutionBlock)executionBlock
                                       resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
                               resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue {
    self = [self initWithAsynchronousExecutionBlock:executionBlock];
    [self setResultBlock:resultBlock resultCallbackQueue:resultCallbackQueue];
    return self;
}

#pragma mark - Subclassing

- (void)setResultBlock:(KMYAsynchronousOperationResultBlock)resultBlock resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue {
    _resultBlock            = [resultBlock copy];
    _resultCallbackQueue    = resultCallbackQueue ?: kmy_dispatch_get_utility_queue();
}

- (void)setOperationComplete {
    [self setOperationCompleteWithResult:nil];
}

- (void)setOperationCompleteWithResult:(nullable id)result {

    if (_resultBlock) {
        dispatch_async(_resultCallbackQueue, ^{
            _resultBlock(result, self.isCancelled);
            _resultBlock = nil;
        });
    }

    self.executing  = NO;
    self.finished   = YES;
}

- (void)execute {
    KMYAssertFail(@"The execute method must be overridden if you are not using any of the given execution blocks.");
}

#pragma mark - NSOperation

- (void)cancel {
    [super cancel];
}

- (BOOL)isCancelled {
    return [super isCancelled];
}

- (void)start {

    // From docs:
    // If you are implementing a concurrent operation, you must override this method and use it to
    // initiate your operation. Your custom implementation must not call super at any time.

    if (_syncExecutionBlock) {
        id result = _syncExecutionBlock(self);
        [self setOperationCompleteWithResult:result];
    } else if (_asyncExecutionBlock) {
        _asyncExecutionBlock(self, ^(id _Nullable result) {
            [self setOperationCompleteWithResult:result];
        });
    } else {
        [self execute];
    }
}

- (BOOL)isAsynchronous {
    return YES;
}

- (BOOL)isExecuting {
    BOOL isExecuting;
    OSSpinLockLock(&_isExecutingLock);
    isExecuting = _isExecuting;
    OSSpinLockUnlock(&_isExecutingLock);
    return isExecuting;
}

- (void)setExecuting:(BOOL)isExecuting {
    if (isExecuting != self.isExecuting) {
        static NSString * const key = @"isExecuting";
        [self willChangeValueForKey:key];
        OSSpinLockLock(&_isExecutingLock);
        _isExecuting = isExecuting;
        OSSpinLockUnlock(&_isExecutingLock);
        [self didChangeValueForKey:key];
    }
}

- (BOOL)isFinished {
    BOOL isFinished;
    OSSpinLockLock(&_isFinishedLock);
    isFinished = _isFinished;
    OSSpinLockUnlock(&_isFinishedLock);
    return isFinished;
}

- (void)setFinished:(BOOL)isFinished {
    if (isFinished != self.isFinished) {
        static NSString * const key = @"isFinished";
        [self willChangeValueForKey:key];
        OSSpinLockLock(&_isFinishedLock);
        _isFinished = isFinished;
        OSSpinLockUnlock(&_isFinishedLock);
        [self didChangeValueForKey:key];
    }
}

@end
























