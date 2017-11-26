//
//  KMYManagedObject.h
//  KMYKit
//
//  Created on 13/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYManagedObject : NSManagedObject

+ (__kindof KMYManagedObject *)insertNewInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext NS_REQUIRES_SUPER;

+ (void)deleteManagedObject:(__kindof KMYManagedObject *)managedObject;
+ (void)deleteManagedObject:(__kindof KMYManagedObject *)managedObject
      processPendingChanges:(BOOL)processPendingChanges;
+ (BOOL)deleteAllInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext error:(NSError **)error;

/// By default, an entity name with the same name as the subclass is assumed. Subclasses can override @c entityName: method to provide a custom name.
/// @remark If the Xcode code generation creates a method with the same name, i.e. @c fetchRequest, that should do the same thing as this method does, and
///         fetch methods methods, such as @c executeFetchInManagedObjectContext:error:, will call the subclass’s @c fetchRequest method instead of this one.
/// @return A new fetch request initialized with the Entity represented by this subclass.
+ (NSFetchRequest<__kindof KMYManagedObject *> *)fetchRequest;
+ (NSFetchRequest<__kindof KMYManagedObject *> *)shallowFetchRequest;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (nullable NSArray<__kindof KMYManagedObject *> *)executeFetchInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                                                                error:(NSError **)error;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (nullable NSArray<__kindof KMYManagedObject *> *)executeFetchWithPredicate:(nullable NSPredicate *)predicate
                                                      inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                                                       error:(NSError **)error;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (NSArray<__kindof KMYManagedObject *> *)executeFetchWithSortDescriptors:(NSArray *)sortDescriptors
                                                   inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                                                    error:(NSError **)error;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (nullable NSArray<__kindof KMYManagedObject *> *)executeFetchWithPredicate:(nullable NSPredicate *)predicate
                                                             sortDescriptors:(nullable NSArray *)sortDescriptors
                                                      inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                                                       error:(NSError **)error;

/// @return An array with the results; an empty array if there were no results; or @c nil if an error occurred.
+ (nullable NSArray<__kindof KMYManagedObject *> *)executeFetchWithRequest:(nullable NSFetchRequest *)fetchRequest
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
