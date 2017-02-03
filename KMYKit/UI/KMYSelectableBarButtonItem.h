//
//  KMYSelectableBarButtonItem.h
//  KMYKit
//
//  Created on 2017-02-01.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// Wraps a @c KMYSelectableButton as the custom view so it can be used in navigation bars.
@interface KMYSelectableBarButtonItem : UIBarButtonItem

@property(nonatomic, assign, getter = isSelected)   BOOL    selected;

+ (instancetype)buttonWithTitle:(nullable NSString *)title
                        handler:(void (^_Nullable)(__kindof KMYSelectableBarButtonItem *buttonItem))handler;

+ (instancetype)buttonWithSystemItem:(UIBarButtonSystemItem)barButtonSystemItem
                             handler:(void (^_Nullable)(__kindof KMYSelectableBarButtonItem *buttonItem))handler;

@end

NS_ASSUME_NONNULL_END
