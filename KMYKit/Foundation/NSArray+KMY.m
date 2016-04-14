//
//  NSArray+KMY.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSObject+KMY.h"
#import "NSArray+KMY.h"

@implementation NSArray (KMY)

+ (instancetype)kmy_arrayWithInitializer:(void (^)(NSMutableArray *array))initializer {
    if ([self class] == [NSArray class]) {
        // If this is non mutable, pass a mutable version to the initializer.
        NSMutableArray *array = [[NSMutableArray alloc] init];
        if (array && initializer != NULL) initializer(array);
        return [array copy];
    } else {
        return [super kmy_objectWithInitializer:initializer];
    }
}

@end
