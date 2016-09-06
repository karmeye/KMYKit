//
//  NSURL+KMY.m
//  KMYKit
//
//  Created on 05/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSURL+KMY.h"

@implementation NSURL (KMY)

+ (instancetype)kmy_ensuredAbsoluteURLWithString:(NSString *)stringRepresentation relativeToFallbackURL:(NSURL *)fallbackBaseURL {

    NSURL *URL;

    if (stringRepresentation && fallbackBaseURL) {
        static NSString * const http    = @"http://";
        static NSString * const https   = @"https://";
        static NSString * const file    = @"file://";

        if ([stringRepresentation hasPrefix:http] || [stringRepresentation hasPrefix:https] || [stringRepresentation hasPrefix:file]) {
            // This method expects URLString to contain only characters that are allowed in a properly formed URL. All other characters must be properly percent escaped. Any percent-escaped characters are interpreted using UTF-8 encoding.
            URL = [NSURL URLWithString:stringRepresentation];
        } else {
            URL = [NSURL URLWithString:stringRepresentation relativeToURL:fallbackBaseURL];
        }
    }

    return URL;
}

@end
