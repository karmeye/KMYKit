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

typedef void (^KMYPersistentStoreOperationExecutionBlock)(NSManagedObjectContext *managedObjectContext);

@interface KMYPersistentStoreOperation : KMYAsynchronousOperation

- (instancetype)initWithContainer:(KMYPersistentContainer *)container executionBlock:(KMYPersistentStoreOperationExecutionBlock)executionBlock;

@end

@interface NSOperationQueue (KMYPersistentStoreOperation)

+ (NSOperationQueue *)kmy_queueForPersistantStoreOperations;

@end

NS_ASSUME_NONNULL_END
