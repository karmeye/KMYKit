//
//  KMYSection.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYSection.h"

@interface KMYSection ()

@property (nonatomic, strong, readwrite, nullable)  NSArray<KMYItem *>  *items;
@property (nonatomic, strong, readwrite)            NSDictionary        *attributeDictionary;

@end

@implementation KMYSection

+ (instancetype)sectionWithItems:(NSArray *)items {
    KMYSection *instance = [[[self class] alloc] init];

    if (self) {
        instance.items = items;
    }

    return instance;
}

+ (instancetype)sectionWithItemsInitializer:(void (^)(NSMutableArray *items))itemsInitializer {
    KMYSection *instance = [[[self class] alloc] init];

    if (self) {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        itemsInitializer(items);
        instance.items = [items copy];
    }

    return instance;
}

+ (instancetype)sectionWithInitializer:(void (^)(NSMutableDictionary * attributes, NSMutableArray * items))initializer {
    KMYSection *instance = [[[self class] alloc] init];

    if (self) {
        NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
        NSMutableArray *items = [[NSMutableArray alloc] init];
        initializer(attributes, items);

        if (attributes.count > 0) instance.attributeDictionary = [attributes copy];
        if (items.count > 0) instance.items = [items copy];
    }

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












































