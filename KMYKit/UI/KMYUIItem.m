//
//  KMYUIItem.m
//  KMYKit
//
//  Created on 28/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYUIItem.h"

NSString * const KMYUIItemKeyText               = @"KMYUIItemKeyText";
NSString * const KMYUIItemKeyTextHandler        = @"KMYUIItemKeyTextHandler";
NSString * const KMYUIItemKeyDetailText         = @"KMYUIItemKeyDetailText";
NSString * const KMYUIItemKeyImage              = @"KMYUIItemKeyImage";
NSString * const KMYUIItemKeyType               = @"KMYUIItemKeyType";
NSString * const KMYUIItemKeyEditingOptions     = @"KMYUIItemKeyEditingOptions";

@interface KMYUIItem ()

@property (nonatomic, copy, readwrite)     dispatch_block_t        actionHandler;

@end

@implementation KMYUIItem

@dynamic editingOptions, type, text, detailText, image;

+ (KMYUIItem *)itemWithAttributes:(NSDictionary *)dictionary actionHandler:(dispatch_block_t)actionHandler {

    KMYUIItem *item = [[self class] itemWithAttributes:dictionary];
    item.actionHandler = actionHandler;

    return item;
}

#pragma mark - Public -

- (KMYUIItemType)type {
    return [[self.attributeDictionary kmy_numberForKey:KMYUIItemKeyType] integerValue];
}

- (KMYUIItemEditingOptions)editingOptions {
    return [self.attributeDictionary kmy_unsignedIntegerForKey:KMYUIItemKeyEditingOptions defaultValue:0];
}

- (NSString *)text {
    NSString *text = self.attributeDictionary[KMYUIItemKeyText];

    if (!text) {
        KMYUIItemTextHandler textHandler = self.attributeDictionary[KMYUIItemKeyTextHandler];
        text = textHandler ? textHandler() : nil;
    }

    return text;
}

- (NSString *)detailText {
    return [self valueForAttribute:KMYUIItemKeyDetailText];
}

- (UIImageView *)image {
    return [self valueForAttribute:KMYUIItemKeyImage];
}

@end




























