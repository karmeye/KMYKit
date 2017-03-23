//
//  KMYSection.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYSection.h"
#import "KMYBlock.h"

@interface KMYSection ()

@property (nonatomic, strong, readwrite, nullable)  NSArray<KMYItem *>              *items;
@property (nonatomic, strong, readwrite)            NSDictionary<NSString *, id>    *attributeDictionary;

@end

@implementation KMYSection

+ (instancetype)sectionWithItems:(NSArray *)items {
    KMYSection *instance = [[[self class] alloc] init];
    instance.items = items;
    return instance;
}

+ (instancetype)sectionWithItemsInitializer:(void (^)(NSMutableArray *items))itemsInitializer {
    KMYSection *instance = [[[self class] alloc] init];

    NSMutableArray *items = [[NSMutableArray alloc] init];
    itemsInitializer(items);
    instance.items = [items copy];

    return instance;
}

+ (instancetype)sectionWithInitializer:(void (^)(NSMutableDictionary<NSString *, id> *attributes, NSMutableArray *items))initializer {
    KMYSection *instance = [[[self class] alloc] init];

    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    initializer(attributes, items);

    if (attributes.count > 0) instance.attributeDictionary = [attributes copy];
    if (items.count > 0) instance.items = [items copy];

    return instance;
}

- (KMYItem *)itemAtIndex:(NSUInteger)index {
    if (index < self.numberOfItems) {
        return self.items[index];
    } else {
        return nil;
    }
}

- (NSUInteger)numberOfItems {
    return self.items != nil ? self.items.count : 0;
}

#pragma mark - NSCopying protocol

- (id)copyWithZone:(NSZone *)zone {
    KMYSection *copy            = [KMYSection allocWithZone:zone];
    copy.items                  = [self.items copy];
    copy.attributeDictionary    = [self.attributeDictionary copy];
    return copy;
}

#pragma mark - NSMutableCopying protocol

- (id)mutableCopyWithZone:(NSZone *)zone {
    KMYMutableSection *copy     = [KMYMutableSection allocWithZone:zone];
    copy.items                  = [self.items copy];
    copy.attributeDictionary    = [self.attributeDictionary copy];
    return copy;
}

#pragma mark - KMYItemAttributes Protocol

- (NSArray<NSString *> *)attributes {
    return self.attributeDictionary != nil ? self.attributeDictionary.allKeys : @[];
}

- (id)valueForAttribute:(NSString *)key {
    return self.attributeDictionary[key];
}

- (NSDictionary *)valuesForAttributes:(NSArray *)keys {
    return [self.attributeDictionary dictionaryWithValuesForKeys:keys];
}

@end

@implementation KMYMutableSection

- (void)insertItem:(__kindof KMYItem *)item atIndex:(NSUInteger)index {
    NSMutableArray *items = [self.items mutableCopy];
    [items insertObject:item atIndex:index];
    self.items = [items copy];
}

- (void)replaceItemAtIndex:(NSUInteger)index withItem:(__kindof KMYItem *)item {
    NSMutableArray *items = [self.items mutableCopy];
    [items replaceObjectAtIndex:index withObject:item];
    self.items = [items copy];
}

@end










































