//
//  KMYFileManager.h
//  KMYKit
//
//  Created on 2016-10-27.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYFileManager : NSObject

/// /Application/A30F8554-DA4D-48F4-816E-551F4366A9D2/Documents/
@property(class, nonatomic, readonly, strong, nullable)     NSURL        *documentsDirectoryURL;

/// /Application/C8023F9F-95D2-474C-AD16-D73EAC385386/Library/
@property(class, nonatomic, readonly, strong, nullable)     NSURL        *libraryDirectoryURL;

/// /Application/C8023F9F-95D2-474C-AD16-D73EAC385386/Library/Application Support
@property(class, nonatomic, readonly, strong, nullable)     NSURL        *applicationSupportDirectoryURL;

/// /Application/D4F3112B-5CD7-4556-82F7-1C77F64C7C11/Library/Caches/
@property(class, nonatomic, readonly, strong, nullable)     NSURL        *cachesDirectoryURL;

/// @returns @c YES if the directory was created or already exists. @c NO if an error occured.
- (BOOL)createDirectoryAtURL:(NSURL *)URL error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
