//
//  KMYPersistentStoreOperation.m
//  KMYKit
//
//  Created on 22/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYPersistentStoreOperation.h"
#import "KMYSerialOperationQueue.h"
#import "KMYAssert.h"
#import "KMYDispatch.h"

@interface KMYPersistentStoreOperation ()
@end

@implementation KMYPersistentStoreOperation {
    KMYPersistentContainer                                  *_persistentContainer;
    KMYPersistentStoreOperationSynchronousExecutionBlock    _syncExecutionBlock;
    KMYPersistentStoreOperationAsynchronousExecutionBlock   _asyncExecutionBlock;
}

- (instancetype)initWithContainer:(KMYPersistentContainer *)container
        synchronousExecutionBlock:(KMYPersistentStoreOperationSynchronousExecutionBlock)executionBlock {
    self = [super init];
    _persistentContainer    = container;
    _syncExecutionBlock     = [executionBlock copy];
    return self;
}

- (instancetype)initWithContainer:(KMYPersistentContainer *)container
        synchronousExecutionBlock:(KMYPersistentStoreOperationSynchronousExecutionBlock)executionBlock
                      resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
              resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue {
    self = [self initWithContainer:container synchronousExecutionBlock:executionBlock];
    [self setResultBlock:resultBlock resultCallbackQueue:resultCallbackQueue];
    return self;
}

- (instancetype)initWithContainer:(KMYPersistentContainer *)container
       asynchronousExecutionBlock:(KMYPersistentStoreOperationAsynchronousExecutionBlock)executionBlock {
    self = [super init];
    _persistentContainer    = container;
    _asyncExecutionBlock    = [executionBlock copy];
    return self;
}

- (instancetype)initWithContainer:(KMYPersistentContainer *)container
       asynchronousExecutionBlock:(KMYPersistentStoreOperationAsynchronousExecutionBlock)executionBlock
                      resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
              resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue {
    self = [self initWithContainer:container asynchronousExecutionBlock:executionBlock];
    [self setResultBlock:resultBlock resultCallbackQueue:resultCallbackQueue];
    return self;
}

#pragma mark - KMYAsynchronousOperation

- (void)execute {
    [_persistentContainer performBackgroundTask:^(NSManagedObjectContext *backgroundContext) {
        if (_syncExecutionBlock) {
            id result = _syncExecutionBlock(backgroundContext, self);
            [self setOperationCompleteWithResult:result];
        } else if (_asyncExecutionBlock) {
            _asyncExecutionBlock(backgroundContext, self, ^(id _Nullable result) {
                [self setOperationCompleteWithResult:result];
            });
        } else {
            KMYAssertFail(@"No execution block given.");
        }
    }];
}

@end

@implementation NSOperationQueue (KMYPersistentStoreOperation)

+ (NSOperationQueue *)kmy_queueForPersistantStoreOperations {
    return [KMYSerialOperationQueue queue];
}

@end





























