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
    id<KMYBackgroundContextProviding>                       _contextProvider;
    KMYPersistentStoreOperationSynchronousExecutionBlock    _syncExecutionBlock;
    KMYPersistentStoreOperationAsynchronousExecutionBlock   _asyncExecutionBlock;
}

- (instancetype)initWithContextProvider:(id<KMYBackgroundContextProviding>)contextProvider
              synchronousExecutionBlock:(KMYPersistentStoreOperationSynchronousExecutionBlock)executionBlock {
    self = [super init];
    _contextProvider        = contextProvider;
    _syncExecutionBlock     = [executionBlock copy];
    return self;
}

- (instancetype)initWithContextProvider:(id<KMYBackgroundContextProviding>)contextProvider
              synchronousExecutionBlock:(KMYPersistentStoreOperationSynchronousExecutionBlock)executionBlock
                            resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
                    resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue {
    self = [self initWithContextProvider:contextProvider synchronousExecutionBlock:executionBlock];
    [self setResultBlock:resultBlock resultCallbackQueue:resultCallbackQueue];
    return self;
}

- (instancetype)initWithContextProvider:(id<KMYBackgroundContextProviding>)contextProvider
             asynchronousExecutionBlock:(KMYPersistentStoreOperationAsynchronousExecutionBlock)executionBlock {
    self = [super init];
    _contextProvider        = contextProvider;
    _asyncExecutionBlock    = [executionBlock copy];
    return self;
}

- (instancetype)initWithContextProvider:(id<KMYBackgroundContextProviding>)contextProvider
             asynchronousExecutionBlock:(KMYPersistentStoreOperationAsynchronousExecutionBlock)executionBlock
                            resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
                    resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue {
    self = [self initWithContextProvider:contextProvider asynchronousExecutionBlock:executionBlock];
    [self setResultBlock:resultBlock resultCallbackQueue:resultCallbackQueue];
    return self;
}

#pragma mark - KMYAsynchronousOperation

- (void)execute {
    NSManagedObjectContext *backgroundContext = [_contextProvider newBackgroundContext];
    [backgroundContext performBlock:^{
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

#pragma mark -

@implementation NSOperationQueue (KMYPersistentStoreOperation)

+ (NSOperationQueue *)kmy_queueForPersistentStoreOperations {
    return [KMYSerialOperationQueue queue];
}

@end





























