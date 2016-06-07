//
//  NSAttributedString+KMY.m
//  KMYKit
//
//  Created on 09/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSAttributedString+KMY.h"
#import "NSObject+KMY.h"

@implementation NSAttributedString (KMY)

+ (instancetype)kmy_stringWithInitializer:(void (^)(NSMutableAttributedString *string))initializer {
    if (initializer != NULL && [self class] == [NSAttributedString class]) {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] init];
        initializer(string);
        return [string copy];
    } else {
        return [super kmy_objectWithInitializer:initializer];
    }
}

@end
