//
//  KMYAbsoluteURL.h
//  KMYKit
//
//  Created on 14/09/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// An instance of this class can only exist if it’s `URL` property is an absolute URL.
@interface KMYAbsoluteURL : NSObject <NSCopying>

@property (nonatomic, copy, readonly)       NSURL       *URL;

/// Shorthand for URL.absoluteURL.
@property (nonatomic, copy, readonly)       NSString    *string;

- (instancetype)init NS_UNAVAILABLE;
+ (nullable instancetype)absoluteURLWithURL:(NSURL *)URL;
+ (nullable instancetype)absoluteURLWithString:(NSString *)string relativeToFallbackbaseURL:(NSURL *)fallbackBaseURL;

@end

NS_ASSUME_NONNULL_END
