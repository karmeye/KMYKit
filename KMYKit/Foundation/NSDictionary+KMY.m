//
//  NSDictionary+KMY.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSDictionary+KMY.h"
#import "NSObject+KMY.h"

@implementation NSDictionary (KMY)

+ (instancetype)kmy_dictionaryWithInitializer:(void (^)(NSMutableDictionary *dictionary))initializer {
    if ([self class] == [NSDictionary class]) {
        // If this is non mutable, pass a mutable version to the initializer.
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        if (dictionary && initializer != NULL) initializer(dictionary);
        return [dictionary copy];
    } else {
        return [super kmy_objectWithInitializer:initializer];
    }
}

- (BOOL)kmy_boolForKey:(id)key {
    NSNumber *number = [self kmy_numberForKey:key];
    return number ? [number boolValue] : NO;
}

- (NSNumber *)kmy_numberForKey:(id)key {
    NSObject *object = self[key];

    if (!object) {
        return nil;
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)object;
    } else {
        return nil;
    }
}

- (NSInteger)kmy_integerForKey:(id)key defaultValue:(NSInteger)defaultValue {
    NSNumber *number = [self kmy_numberForKey:key];
    return number ? [number integerValue] : defaultValue;
}

- (NSUInteger)kmy_unsignedIntegerForKey:(id)key defaultValue:(NSUInteger)defaultValue {
    NSNumber *number = [self kmy_numberForKey:key];
    return number ? [number unsignedIntegerValue] : defaultValue;
}


@end
