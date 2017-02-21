//
//  KMYAbsoluteURL.m
//  KMYKit
//
//  Created on 14/09/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYAbsoluteURL.h"
#import "NSURL+KMY.h"

@interface KMYAbsoluteURL ()
@end

@implementation KMYAbsoluteURL

@dynamic string;

+ (instancetype)absoluteURLWithURL:(NSURL *)URL {

    KMYAbsoluteURL *instance;

    if ([[self class] isFullNetworkURL:URL] || [URL isFileURL]) {
        instance = [[self alloc] init];
        instance->_URL = [URL copy];
    }

    return instance;
}

+ (instancetype)absoluteURLWithString:(NSString *)string relativeToFallbackbaseURL:(NSURL *)fallbackBaseURL {
    NSURL *URL = [NSURL kmy_ensuredAbsoluteURLWithString:string relativeToFallbackURL:fallbackBaseURL];
    return [[self class] absoluteURLWithURL:URL];
}

#pragma mark - NSObject Protocol

- (NSString *)description {
    return [self.URL description];
}

#pragma mark NSCopying Protocol

- (id)copyWithZone:(nullable NSZone *)zone {
    return [[self class] absoluteURLWithURL:self.URL];
}

#pragma mark -

- (NSString *)string {
    return self.URL.absoluteString;
}

#pragma mark -

+ (BOOL)isFullNetworkURL:(NSURL *)URL {
    /*

     NSURL *a = [NSURL URLWithString:@"http://example.com/monkey/monkey.jpg"];
     DDLogDebug(@"%@ %@ %@ %@ — host %@, %d %d", a.absoluteString, a.scheme, a.baseURL, a.resourceSpecifier, a.host, a.isFileReferenceURL, [a app_isFullNetworkURL]);
     a = [NSURL URLWithString:@"example.com/monkey/monkey.jpg"];
     DDLogDebug(@"%@ %@ %@ %@ — host %@, %d %d", a.absoluteString, a.scheme, a.baseURL, a.resourceSpecifier, a.host, a.isFileURL, [a app_isFullNetworkURL]);
     a = [NSURL URLWithString:@"/monkey/monkey.jpg"];
     DDLogDebug(@"%@ %@ %@ %@ — host %@, %d %d", a.absoluteString, a.scheme, a.baseURL, a.resourceSpecifier, a.host, a.isFileURL, [a app_isFullNetworkURL]);
     a = [NSURL URLWithString:@"httpasdfadf//:"];
     DDLogDebug(@"%@ %@ %@ %@ — host %@, %d %d", a.absoluteString, a.scheme, a.baseURL, a.resourceSpecifier, a.host, a.isFileURL, [a app_isFullNetworkURL]);
     a = [NSURL URLWithString:@"httpasdfadf:"];
     DDLogDebug(@"%@ %@ %@ %@ — host %@, %d %d", a.absoluteString, a.scheme, a.baseURL, a.resourceSpecifier, a.host, a.isFileURL, [a app_isFullNetworkURL]);
     a = [NSURL URLWithString:@"file:///file.txt"];
     DDLogDebug(@"%@ %@ %@ %@ — host %@, %d %d", a.absoluteString, a.scheme, a.baseURL, a.resourceSpecifier, a.host, a.isFileURL, [a app_isFullNetworkURL]);

     */
    
    // `scheme` is what comes before the first colon. If there’s nothing before the first colon or there is, but that value is invalid, scheme will be `nil`.
    //
    return URL && URL.scheme != nil && URL.host != nil && URL.pathComponents.count > 0;
}

@end






























