//
//  KMYPersistentStoreOperation.h
//  KMYKit
//
//  Created on 22/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <KMYKit/KMYAsynchronousOperation.h>
#import <KMYKit/KMYBackgroundContextProviding.h>

NS_ASSUME_NONNULL_BEGIN

typedef id _Nullable (^KMYPersistentStoreOperationSynchronousExecutionBlock)(NSManagedObjectContext *managedObjectContext, id<KMYCancelling> cancellingHandler);
typedef void         (^KMYPersistentStoreOperationAsynchronousExecutionBlock)(NSManagedObjectContext *managedObjectContext, id<KMYCancelling> cancellingHandler, KMYAsynchronousOperationCompetionHandler completionHandler);

@interface KMYPersistentStoreOperation : KMYAsynchronousOperation

- (instancetype)initWithContextProvider:(id<KMYBackgroundContextProviding>)contextProvider
              synchronousExecutionBlock:(KMYPersistentStoreOperationSynchronousExecutionBlock)executionBlock;

- (instancetype)initWithContextProvider:(id<KMYBackgroundContextProviding>)contextProvider
              synchronousExecutionBlock:(KMYPersistentStoreOperationSynchronousExecutionBlock)executionBlock
                            resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
                    resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue;

- (instancetype)initWithContextProvider:(id<KMYBackgroundContextProviding>)contextProvider
             asynchronousExecutionBlock:(KMYPersistentStoreOperationAsynchronousExecutionBlock)executionBlock;

- (instancetype)initWithContextProvider:(id<KMYBackgroundContextProviding>)contextProvider
             asynchronousExecutionBlock:(KMYPersistentStoreOperationAsynchronousExecutionBlock)executionBlock
                            resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
                    resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue;

@end

@interface NSOperationQueue (KMYPersistentStoreOperation)

+ (NSOperationQueue *)kmy_queueForPersistentStoreOperations NS_SWIFT_NAME(kmyQueueForPersistentStoreOperations());

@end

NS_ASSUME_NONNULL_END
