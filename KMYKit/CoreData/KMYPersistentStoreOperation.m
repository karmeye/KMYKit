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
       asynchronousExecutionBlock:(KMYPersistentStoreOperationAsynchronousExecutionBlock)executionBlock {
    self = [super init];
    _persistentContainer    = container;
    _asyncExecutionBlock     = [executionBlock copy];
    return self;
}

#pragma mark - KMYAsynchronousOperation

- (void)execute {
    [_persistentContainer performBackgroundTask:^(NSManagedObjectContext *backgroundContext) {
        if (_syncExecutionBlock) {
            _syncExecutionBlock(backgroundContext, self);
            [self setOperationComplete];
        } else if (_asyncExecutionBlock) {
            _asyncExecutionBlock(backgroundContext, self, ^{
                [self setOperationComplete];
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
