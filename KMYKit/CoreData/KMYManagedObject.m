//
//  KMYManagedObject.m
//  KMYKit
//
//  Created on 13/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYManagedObject.h"
#import <KMYKit/KMY+Foundation.h> 

@implementation KMYManagedObject

#pragma mark - Inserting and Deleting

+ (KMYManagedObject *)insertNewInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    KMYManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:[[self class] entityName] inManagedObjectContext:managedObjectContext];
    [managedObject didInsertNew];
    return managedObject;
}

+ (void)deleteManagedObject:(KMYManagedObject *)managedObject {
    [[self class] deleteManagedObject:managedObject processPendingChanges:NO];
}

+ (void)deleteManagedObject:(KMYManagedObject *)managedObject
      processPendingChanges:(BOOL)processPendingChanges {

    NSManagedObjectContext __weak *refManagedObjectContext = managedObject.managedObjectContext;

    void (^block)(void) = ^{
        [refManagedObjectContext deleteObject:managedObject];
        if (processPendingChanges) {
            [refManagedObjectContext processPendingChanges];
        }
    };

    if (refManagedObjectContext.concurrencyType == NSPrivateQueueConcurrencyType || refManagedObjectContext.concurrencyType == NSMainQueueConcurrencyType) {
        [refManagedObjectContext performBlockAndWait:block];
    } else if (refManagedObjectContext.concurrencyType == NSConfinementConcurrencyType) {
        block();
    } else {
        KMYAssertFail();
    }
}

#pragma mark - Fetching

+ (NSFetchRequest *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:[[self class] entityName]];
}

+ (NSFetchRequest *)shallowFetchRequest {
    NSFetchRequest *fetchRequest        = [[self class] fetchRequest];
    fetchRequest.includesSubentities    = NO;
    fetchRequest.includesPropertyValues = NO;
    return fetchRequest;
}

+ (NSArray *)executeFetchInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                          error:(NSError **)error {
    return [[self class] executeFetchWithRequest:nil predicate:nil sortDescriptors:nil inManagedObjectContext:managedObjectContext error:error];
}

+ (NSArray *)executeFetchWithPredicate:(NSPredicate *)predicate
                inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                 error:(NSError **)error {
    return [[self class] executeFetchWithRequest:nil predicate:predicate sortDescriptors:nil inManagedObjectContext:managedObjectContext error:error];
}

+ (NSArray *)executeFetchWithSortDescriptors:(NSArray *)sortDescriptors
                      inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                       error:(NSError **)error {
    return [[self class] executeFetchWithRequest:nil predicate:nil sortDescriptors:sortDescriptors inManagedObjectContext:managedObjectContext error:error];
}

+ (NSArray *)executeFetchWithPredicate:(NSPredicate *)predicate
                       sortDescriptors:(NSArray *)sortDescriptors
                inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                 error:(NSError **)error {
    return [[self class] executeFetchWithRequest:nil predicate:predicate sortDescriptors:sortDescriptors inManagedObjectContext:managedObjectContext error:error];
}

+ (NSArray *)executeFetchWithRequest:(NSFetchRequest *)fetchRequest
                           predicate:(NSPredicate *)predicate
                     sortDescriptors:(NSArray *)sortDescriptors
              inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                               error:(NSError **)error {

    fetchRequest = fetchRequest ?: [[self class] fetchRequest];

    if (predicate) fetchRequest.predicate = predicate;
    if (sortDescriptors) fetchRequest.sortDescriptors = sortDescriptors;

    NSError *localError;
    NSArray *items = [managedObjectContext executeFetchRequest:fetchRequest error:&localError];

    if (localError && error != NULL) *error = localError;

    return items;
}

+ (NSUInteger)numberOfResultsInManagedObjectContext:(NSManagedObjectContext*)managedObjectContext
                                              error:(NSError **)error {
    NSError *localError;
    NSArray *result = [[self class] executeFetchWithRequest:[[self class] shallowFetchRequest]
                                                  predicate:nil
                                            sortDescriptors:nil
                                     inManagedObjectContext:managedObjectContext
                                                      error:&localError];

    if (localError && error != NULL) *error = localError;

    return localError ? 0 : result.count;
}

#pragma mark - Subclassing

+ (NSString *)entityName {
    static NSString *_defaultEntityName;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultEntityName = NSStringFromClass(self);
    });
    return _defaultEntityName;
}

- (void)didInsertNew {
}

@end











































