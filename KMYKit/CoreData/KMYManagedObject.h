//
//  KMYManagedObject.h
//  KMYKit
//
//  Created on 13/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <KMYKit/KMY+Foundation.h> 

NS_ASSUME_NONNULL_BEGIN

@interface KMYManagedObject : NSManagedObject

+ (__kindof KMYManagedObject *)insertNewInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext NS_REQUIRES_SUPER;

+ (void)deleteManagedObject:(__kindof KMYManagedObject *)managedObject;
+ (void)deleteManagedObject:(__kindof KMYManagedObject *)managedObject
      processPendingChanges:(BOOL)processPendingChanges;

+ (NSFetchRequest *)fetchRequest;
+ (NSFetchRequest *)shallowFetchRequest;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (nullable NSArray *)executeFetchInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                                   error:(NSError **)error;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (nullable NSArray *)executeFetchWithPredicate:(nullable NSPredicate *)predicate
                         inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                          error:(NSError **)error;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (NSArray *)executeFetchWithSortDescriptors:(NSArray *)sortDescriptors
                      inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                       error:(NSError **)error;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (nullable NSArray *)executeFetchWithPredicate:(nullable NSPredicate *)predicate
                                sortDescriptors:(nullable NSArray *)sortDescriptors
                         inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                          error:(NSError **)error;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (nullable NSArray *)executeFetchWithRequest:(nullable NSFetchRequest *)fetchRequest
                                    predicate:(nullable NSPredicate *)predicate
                              sortDescriptors:(nullable NSArray *)sortDescriptors
                       inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                        error:(NSError **)error;

+ (NSUInteger)numberOfResultsInManagedObjectContext:(NSManagedObjectContext*)managedObjectContext
                                              error:(NSError **)error;

@end

@interface KMYManagedObject (Subclassing)

/// @note When overriding this method, do not call super.
/// @return The name of the class as a NSString.
+ (NSString *)entityName;

/// Override to set default/mandatory property values.
- (void)didInsertNew NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END