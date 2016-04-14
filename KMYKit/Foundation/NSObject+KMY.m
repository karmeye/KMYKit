//
//  NSObject+KMY.m
//  KMYKit
//
//  Created on 24/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSObject+KMY.h"

@implementation NSObject (KMY)

+ (instancetype)kmy_objectWithInitializer:(void (^)(__kindof NSObject *object))initializer {
    NSObject *object = [[[self class] alloc] init];
    if (object && initializer != NULL) initializer(object);
    return object;
}

@end
