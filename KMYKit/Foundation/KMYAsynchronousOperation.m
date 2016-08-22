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

@property (nonatomic, copy)     KMYAsynchronousOperationExecutionBlock      executionBlock;

@end

@implementation KMYAsynchronousOperation {
    OSSpinLock  _isExecutingLock;

    BOOL        _isExecuting;
    BOOL        _isFinished;
}

- (instancetype)init {
    self = [super init];

    _isExecutingLock = OS_SPINLOCK_INIT;
    
    return self;
}

- (instancetype)initWithExecutionBlock:(KMYAsynchronousOperationExecutionBlock)executionBlock {
    self = [self init];
    self.executionBlock = executionBlock;
    return self;
}

#pragma mark - Subclassing

- (void)setOperationComplete {
    self.executing  = NO;
    self.finished   = YES;
}

#pragma mark - NSOperation

- (void)start {

    // From docs:
    // If you are implementing a concurrent operation, you must override this method and use it to
    // initiate your operation. Your custom implementation must not call super at any time.

    if (self.isCancelled) {
        [self setOperationComplete];
    } else {
        if (self.executionBlock) {
            self.executionBlock();
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
























