//
//  KMYUIItem.h
//  KMYKit
//
//  Created on 28/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMY+Foundation.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString * const KMYUIItemReuseIdentifier;
extern NSString * const KMYUIItemKeyText;
extern NSString * const KMYUIItemKeyTextHandler;
extern NSString * const KMYUIItemKeyDetailText;
extern NSString * const KMYUIItemKeyType;

typedef NSString * _Nullable (^KMYUIItemTextHandler)();

typedef NS_ENUM(NSInteger, KMYUIItemType) {
    KMYUIItemTypeNone = 0,
    KMYUIItemTypeSelectable,
    KMYUIItemTypeDisclosure
};

@interface KMYUIItem : KMYItem

@property (nonatomic, readonly, nullable)           NSString                *reuseIdentifier;
@property (nonatomic, readonly)                     KMYUIItemType           type;
@property (nonatomic, readonly, nullable)           NSString                *text;
@property (nonatomic, copy, readonly, nullable)     dispatch_block_t        actionHandler;

+ (KMYUIItem *)itemWithAttributes:(nullable NSDictionary *)dictionary
                    actionHandler:(nullable dispatch_block_t)actionHandler;

@end

NS_ASSUME_NONNULL_END