//
//  KMYPersistentContainer.m
//  KMYKit
//
//  Created on 16/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYPersistentContainer.h"
#import <KMYKit/KMY+Foundation.h> 

@interface KMYPersistentContainer ()

@end

@implementation KMYPersistentContainer

//- (instancetype)initWithName:(NSString *)name {
//    return self;
//}

- (instancetype)initWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model {

    self = [super init];

    _name                       = [name copy];
    _managedObjectModel         = model;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];

    _viewContext                = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _viewContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        
    return self;
}

- (void)loadPersistentStoreWithCompletionHandler:(void (^)(NSDictionary *options, NSError *error))block {

    NSURL *URL = [[[self class] defaultDirectoryURL] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", self.name]];

    NSDictionary *options = @{ NSMigratePersistentStoresAutomaticallyOption : @YES,
                               NSInferMappingModelAutomaticallyOption : @YES };
    NSError *error;

    [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:URL options:options error:&error];

    if (error) {
        [[NSFileManager defaultManager] removeItemAtURL:URL error:nil];
    } else {
    }

    block(options, error);
}

#pragma mark -

- (NSManagedObjectContext *)newBackgroundContext {
    KMYAssert(self.persistentStoreCoordinator);

    NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];

    if (self.viewContext.parentContext) {
        managedObjectContext.parentContext = self.viewContext.parentContext;
    } else {
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;

        // Needed? http://stackoverflow.com/questions/37581441/nsmanagedobjectcontextdidsavenotification-useless
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(managedObjectContextDidSaveNotification:) name:NSManagedObjectContextDidSaveNotification object:managedObjectContext];
    }

    return managedObjectContext;
}

- (void)performBackgroundTask:(void (^)(NSManagedObjectContext *managedObjectContext))block {
    NSManagedObjectContext *context = [self newBackgroundContext];
    [context performBlock:^{
        block(context);
    }];
}

- (void)performBackgroundTask:(void (^)(NSManagedObjectContext *backgroundContext))block completion:(void (^)(NSManagedObjectContext *viewContext))completion {
    NSManagedObjectContext *context = [self newBackgroundContext];
    [context performBlock:^{
        block(context);
        [self.viewContext performBlock:^{
            completion(self.viewContext);   // Purposely retains self to make sure the view context etc isn’t to
        }];
    }];
}

#pragma mark -

- (void)managedObjectContextDidSaveNotification:(NSNotification*)notification {
    NSManagedObjectContext *managedObjectContext = KMYCastIfKindOfClass(notification.object, NSManagedObjectContext);

    if (managedObjectContext.concurrencyType == NSPrivateQueueConcurrencyType) {
        [self.viewContext performBlock:^{
            [self.viewContext mergeChangesFromContextDidSaveNotification:notification];
        }];
    }
}

#pragma mark -

+ (NSURL *)defaultDirectoryURL {
    static dispatch_once_t onceToken;
    static NSURL *defaultDirectoryURL = nil;
    dispatch_once(&onceToken, ^{
        defaultDirectoryURL = [NSFileManager.defaultManager URLForDirectory:NSApplicationSupportDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    });
    return defaultDirectoryURL;
}

@end





































