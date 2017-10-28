//
//  KMYPersistentStoreOperation.h
//  KMYKit
//
//  Created on 22/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <KMYKit/KMYAsynchronousOperation.h>
#import <KMYKit/KMYPersistentContainer.h>

NS_ASSUME_NONNULL_BEGIN

typedef id _Nullable (^KMYPersistentStoreOperationSynchronousExecutionBlock)(NSManagedObjectContext *managedObjectContext, id<KMYCancelling> cancellingHandler);
typedef void         (^KMYPersistentStoreOperationAsynchronousExecutionBlock)(NSManagedObjectContext *managedObjectContext, id<KMYCancelling> cancellingHandler, KMYAsynchronousOperationCompetionHandler completionHandler);

@interface KMYPersistentStoreOperation : KMYAsynchronousOperation

- (instancetype)initWithContainer:(KMYPersistentContainer *)container
        synchronousExecutionBlock:(KMYPersistentStoreOperationSynchronousExecutionBlock)executionBlock;

- (instancetype)initWithContainer:(KMYPersistentContainer *)container
        synchronousExecutionBlock:(KMYPersistentStoreOperationSynchronousExecutionBlock)executionBlock
                      resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
              resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue;

- (instancetype)initWithContainer:(KMYPersistentContainer *)container
       asynchronousExecutionBlock:(KMYPersistentStoreOperationAsynchronousExecutionBlock)executionBlock;

- (instancetype)initWithContainer:(KMYPersistentContainer *)container
       asynchronousExecutionBlock:(KMYPersistentStoreOperationAsynchronousExecutionBlock)executionBlock
                      resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
              resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue;

@end

@interface NSOperationQueue (KMYPersistentStoreOperation)

+ (NSOperationQueue *)kmy_queueForPersistantStoreOperations NS_SWIFT_NAME(kmyQueueForPersistantStoreOperations());

@end

NS_ASSUME_NONNULL_END
