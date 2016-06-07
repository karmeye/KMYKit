//
//  KMYItem.m
//  KMYKit
//
//  Created on 28/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYItem.h"
#import "KMYBlock.h"

NSString * const KMYItemKeyValue        = @"KMYItemKeyValue";
NSString * const KMYItemKeyType         = @"KMYItemKeyType";
NSString * const KMYItemKeyID           = @"KMYItemKeyID";

@interface KMYItem ()

@property (nonatomic, strong, readwrite)    NSDictionary        *attributeDictionary;

@end

@implementation KMYItem

@dynamic value, identifier;

- (instancetype)init {
    self = [super init];

    if (self) {
    }

    return self;
}

+ (KMYItem *)itemWithAttributes:(NSDictionary *)dictionary {
    KMYItem *item = [[[self class] alloc] init];
    item.attributeDictionary = dictionary;
    return item;
}

+ (__kindof KMYItem *)itemWithInitializer:(void (^)(NSMutableDictionary *attributes))initializer {
    KMYItem *item = [[[self class] alloc] init];
    if (item && initializer != NULL) {
        NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
        KMYInvokeBlockIfSet(initializer, attributes);
        item.attributeDictionary = [attributes copy];
    }
    return item;
}

- (__kindof KMYItem *)copyWithAttributes:(NSDictionary *)dictionary {
    NSMutableDictionary *attributes = [self.attributeDictionary mutableCopy];
    [attributes addEntriesFromDictionary:dictionary];
    return [[self class] itemWithAttributes:[attributes copy]];
}

#pragma mark - Accessors

- (id)value {
    return [self valueForAttribute:KMYItemKeyValue];
}

- (NSString *)identifier {
    return [self valueForAttribute:KMYItemKeyID];
}

#pragma mark - KMYItemAttributes Protocol

- (NSArray *)attributes {
    return self.attributeDictionary != nil ? self.attributeDictionary.allKeys : @[];
}

- (id)valueForAttribute:(NSString *)key {
    return self.attributeDictionary[key];
}

- (NSDictionary *)valuesForAttributes:(NSArray *)keys {
    return [self.attributeDictionary dictionaryWithValuesForKeys:keys];
}

@end






























