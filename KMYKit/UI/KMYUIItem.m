//
//  KMYUIItem.m
//  KMYKit
//
//  Created on 28/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYUIItem.h"

NSString * const KMYUIItemReuseIdentifier   = @"KMYUIItemReuseIdentifier";
NSString * const KMYUIItemKeyText           = @"KMYUIItemKeyText";
NSString * const KMYUIItemKeyTextHandler    = @"KMYUIItemKeyTextHandler";
NSString * const KMYUIItemKeyDetailText     = @"KMYUIItemKeyDetailText";
NSString * const KMYUIItemKeyType           = @"KMYUIItemKeyType";
NSString * const KMYUIItemKeyEditingOptions = @"KMYUIItemKeyEditingOptions";

@interface KMYUIItem ()

@property (nonatomic, copy, readwrite)     dispatch_block_t        actionHandler;

@end

@implementation KMYUIItem

@dynamic reuseIdentifier, editingOptions, type, text, detailText;

+ (KMYUIItem *)itemWithAttributes:(NSDictionary *)dictionary actionHandler:(dispatch_block_t)actionHandler {

    KMYUIItem *item = [[self class] itemWithAttributes:dictionary];
    item.actionHandler = actionHandler;

    return item;
}

#pragma mark - Public -

- (NSString *)reuseIdentifier {
    return [self valueForAttribute:KMYUIItemReuseIdentifier];
}

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

@end

































