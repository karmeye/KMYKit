//
//  KMYUIItem.h
//  KMYKit
//
//  Created on 28/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMY+Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const KMYUIItemKeyText;
FOUNDATION_EXPORT NSString * const KMYUIItemKeyTextHandler;
FOUNDATION_EXPORT NSString * const KMYUIItemKeyDetailText;
FOUNDATION_EXPORT NSString * const KMYUIItemKeyImage;
FOUNDATION_EXPORT NSString * const KMYUIItemKeyType;
FOUNDATION_EXPORT NSString * const KMYUIItemKeyEditingOptions;

FOUNDATION_EXPORT NSString * const KMYUIItemActionHandlerInfoKeyIndexPath;

@class KMYUIItem;

typedef NS_ENUM(NSInteger, KMYUIItemType) {
    KMYUIItemTypeNone = 0,
    KMYUIItemTypeSelectable,
    KMYUIItemTypeDisclosure
};

typedef NS_OPTIONS(NSUInteger, KMYUIItemEditingOptions) {
    KMYUIItemEditingOptionsNone             = 0,
    KMYUIItemEditingOptionsDelete           = 1UL << 0,
    KMYUIItemEditingOptionsInsert           = 1UL << 1,
    KMYUIItemEditingOptionsModify           = 1UL << 2,
    KMYUIItemEditingOptionsAll              = NSUIntegerMax
};

typedef void (^KMYUIItemActionHandler)(__kindof KMYUIItem *item, NSDictionary * _Nullable info);

typedef NSString * _Nullable (^KMYUIItemTextHandler)();

@interface KMYUIItem : KMYItem

@property (nonatomic, readonly)                     KMYUIItemEditingOptions     editingOptions;
@property (nonatomic, readonly)                     KMYUIItemType               type;
@property (nonatomic, readonly, nullable)           NSString                    *text;
@property (nonatomic, readonly, nullable)           NSString                    *detailText;
@property (nonatomic, readonly, nullable)           UIImage                     *image;

@property (nonatomic, copy, nullable)               KMYUIItemActionHandler      actionHandler;

+ (__kindof KMYUIItem *)itemWithAttributes:(nullable NSDictionary<NSString *, id> *)dictionary
                             actionHandler:(nullable KMYUIItemActionHandler)actionHandler;

@end

NS_ASSUME_NONNULL_END
