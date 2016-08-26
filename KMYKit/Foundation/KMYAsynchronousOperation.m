//
//  KMYAsynchronousOperation.m
//  KMYKit
//
//  Created on 22/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYAsynchronousOperation.h"
#include <libkern/OSAtomic.h>

@interface KMYAsynchronousOperation ()
@end

@implementation KMYAsynchronousOperation {

    KMYAsynchronousOperationSynchronousExecutionBlock   _syncExecutionBlock;
    KMYAsynchronousOperationAsynchronousExecutionBlock  _asyncExecutionBlock;

    OSSpinLock  _isExecutingLock;

    BOOL        _isExecuting;
    BOOL        _isFinished;
}

- (instancetype)init {
    self = [super init];

    _isExecutingLock = OS_SPINLOCK_INIT;
    
    return self;
}

- (instancetype)initWithSynchronousExecutionBlock:(KMYAsynchronousOperationSynchronousExecutionBlock)executionBlock {
    self = [self init];
    _syncExecutionBlock = [executionBlock copy];
    return self;
}

- (instancetype)initWithAsynchronousExecutionBlock:(KMYAsynchronousOperationAsynchronousExecutionBlock)executionBlock {
    self = [self init];
    _asyncExecutionBlock = [executionBlock copy];
    return self;
}

#pragma mark - Subclassing

- (void)setOperationComplete {
    self.executing  = NO;
    self.finished   = YES;
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

    if (self.isCancelled) {
        [self setOperationComplete];
    } else {
        if (_syncExecutionBlock) {
            _syncExecutionBlock(self);
        } else if (_asyncExecutionBlock) {

            KMYAsynchronousOperationCompetionHandler c = ^{
                [self setOperationComplete];
            };

            _asyncExecutionBlock(self, c);

        } else {
            [self execute];
        }
    }
}

- (BOOL)isAsynchronous {
    return YES;
}

- (BOOL)isExecuting {

    // From docs:
    // Your executing property must also provide the status in a thread-safe manner.

    BOOL isExecuting;
    OSSpinLockLock(&_isExecutingLock);
    isExecuting = _isExecuting;
    OSSpinLockUnlock(&_isExecutingLock);
    return isExecuting;
}

- (void)setExecuting:(BOOL)isExecuting {
    if (isExecuting != _isExecuting) {
        NSString * const key = @"isExecuting";
        [self willChangeValueForKey:key];
        OSSpinLockLock(&_isExecutingLock);
        _isExecuting = isExecuting;
        OSSpinLockUnlock(&_isExecutingLock);
        [self didChangeValueForKey:key];
    }
}

- (BOOL)isFinished {
    return _isFinished;
}

- (void)setFinished:(BOOL)isFinished {
    if (isFinished != _isFinished) {
        NSString * const key = @"isFinished";
        [self willChangeValueForKey:key];
        _isFinished = isFinished;
        [self didChangeValueForKey:key];
    }
}

@end























