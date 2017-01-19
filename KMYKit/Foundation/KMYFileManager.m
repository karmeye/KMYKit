//
//  KMYFileManager.m
//  KMYKit
//
//  Created on 2016-10-27.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYFileManager.h"

// File System Programming Guide: https://developer.apple.com/library/prerelease/content/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010672

@implementation KMYFileManager

+ (NSURL *)documentsDirectoryURL {
    static NSURL *URL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        URL = [[NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    });
    return URL;
}

+ (NSURL *)libraryDirectoryURL {
    static NSURL *URL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        URL = [[NSFileManager.defaultManager URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] firstObject];
    });
    return URL;
}

+ (NSURL *)applicationSupportDirectoryURL {
    static NSURL *URL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        URL = [[NSFileManager.defaultManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] firstObject];
    });
    return URL;
}

+ (NSURL *)cachesDirectoryURL {
    static NSURL *URL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        URL = [[NSFileManager.defaultManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] firstObject];
    });
    return URL;
}

+ (BOOL)createDirectoryAtURL:(NSURL *)URL error:(NSError **)error {
    NSError *innerError;
    BOOL success = [NSFileManager.defaultManager createDirectoryAtURL:URL withIntermediateDirectories:YES attributes:nil error:&innerError];
    if (error != NULL && innerError) *error = innerError;
    return success;
}

+ (unsigned long long)sizeOfDirectoryAtURL:(NSURL *)directoryURL {
    // TODO: Error handler and handle failed getResourceValue

    NSDirectoryEnumerator<NSURL *> *enumerator = [NSFileManager.defaultManager enumeratorAtURL:directoryURL
                                                                    includingPropertiesForKeys:@[NSURLFileSizeKey]
                                                                                       options:0
                                                                                  errorHandler:^BOOL(NSURL * _Nonnull url, NSError * _Nonnull error) {
                                                                                      return YES;
                                                                                  }];
    unsigned long long  totalBytes  = 0;
    NSNumber            *value      = nil;
    
    for (NSURL *URL in enumerator) {
        if ([URL getResourceValue:&value forKey:NSURLFileSizeKey error:nil]) {
            totalBytes += [value unsignedLongLongValue];
        } else {}
    }
    
    return totalBytes;
}


@end


























