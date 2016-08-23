//
//  KMYPersistentStoreOperation.m
//  KMYKit
//
//  Created on 22/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYPersistentStoreOperation.h"
#import "KMYSerialOperationQueue.h"

@interface KMYPersistentStoreOperation ()
@end

@implementation KMYPersistentStoreOperation {
    KMYPersistentContainer                      *_persistentContainer;
    KMYPersistentStoreOperationExecutionBlock   _executionBlock;
}

- (instancetype)initWithContainer:(KMYPersistentContainer *)container executionBlock:(KMYPersistentStoreOperationExecutionBlock)executionBlock {
    self = [super init];

    _persistentContainer    = container;
    _executionBlock         = executionBlock;

    return self;
}

#pragma mark - KMYAsynchronousOperation

- (void)execute {
    [_persistentContainer performBackgroundTask:^(NSManagedObjectContext *backgroundContext) {

        _executionBlock(backgroundContext);

        [self setOperationComplete];
    }];
}

@end

@implementation NSOperationQueue (KMYPersistentStoreOperation)

+ (NSOperationQueue *)kmy_queueForPersistantStoreOperations {
    return [KMYSerialOperationQueue queue];
}

@end
