//
//  KMYUISection.m
//  KMYKit
//
//  Created on 28/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYUISection.h"

NSString * const KMYUISectionKeyHeaderTitle     = @"KMYUISectionKeyHeaderTitle";
NSString * const KMYUISectionKeyFooterTitle     = @"KMYUISectionKeyFooterTitle";

@interface KMYUISection ()

@end

@implementation KMYUISection

@dynamic type;

#pragma mark - Public -

- (KMYUISectionType)type {
    return [[self.attributeDictionary kmy_numberForKey:KMYUIItemKeyType] integerValue];
}

@end

























