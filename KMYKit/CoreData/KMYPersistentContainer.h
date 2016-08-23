//
//  KMYPersistentContainer.h
//  KMYKit
//
//  Created on 16/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYPersistentContainer : NSObject

@property (atomic, copy, readonly)      NSString                        *name;
@property (atomic, strong, readonly)    NSManagedObjectModel            *managedObjectModel;
@property (atomic, strong, readonly)    NSPersistentStoreCoordinator    *persistentStoreCoordinator;

/// For read only use.
@property (atomic, strong, readonly)    NSManagedObjectContext          *viewContext;

- (instancetype)init NS_UNAVAILABLE;
//- (nullable instancetype)initWithName:(NSString *)name;
- (nullable instancetype)initWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model;

- (void)loadPersistentStoreWithCompletionHandler:(void (^)(NSDictionary *options, NSError * _Nullable error))block;

- (NSManagedObjectContext *)newBackgroundContext;

- (void)performBackgroundTask:(void (^)(NSManagedObjectContext *backgroundContext))block;
- (void)performBackgroundTask:(void (^)(NSManagedObjectContext *backgroundContext))block completion:(void (^)(NSManagedObjectContext *viewContext))completion;

@end

@interface KMYPersistentContainer (SubclassingHooks)

+ (NSURL *)defaultDirectoryURL;

@end

NS_ASSUME_NONNULL_END
