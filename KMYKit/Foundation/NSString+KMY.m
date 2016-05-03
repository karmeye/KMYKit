//
//  NSString+KMY.m
//  KMYKit
//
//  Created on 03/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSString+KMY.h"
#import "NSObject+KMY.h"

NSString * const KMYEmptyString = @"";

@implementation NSString (KMY)

+ (instancetype)kmy_stringWithInitializer:(void (^)(NSMutableString *string))initializer {
    if (initializer != NULL && [self class] == [NSString class]) {
        NSMutableString *string = [[NSMutableString alloc] init];
        initializer(string);
        return [string copy];
    } else {
        return [super kmy_objectWithInitializer:initializer];
    }
}

@end
