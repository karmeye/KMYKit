//
//  NSMutableString+KMY.m
//  KMYKit
//
//  Created on 14/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSMutableString+KMY.h"

@implementation NSMutableString (KMY)

- (void)kmy_trimWhitespace {
    CFStringTrimWhitespace((__bridge CFMutableStringRef)self);
}

@end
