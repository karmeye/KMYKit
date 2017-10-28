//
//  UIBarButtonItem+KMY.h
//  KMYKit
//
//  Created on 22/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (KMY)

+ (instancetype)kmy_buttonWithTitle:(nullable NSString *)title NS_SWIFT_NAME(init(title:));

+ (instancetype)kmy_buttonWithTitle:(nullable NSString *)title
                            handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(title:handler:));

+ (instancetype)kmy_buttonWithTitle:(nullable NSString *)title
                        initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer
                            handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(title:initializer:handler:));


+ (instancetype)kmy_doneButtonWithTitle:(nullable NSString *)title
                                handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(title:handler:));

+ (instancetype)kmy_doneButtonWithTitle:(nullable NSString *)title
                            initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer
                                handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(doneTitle:initializer:handler:));


+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem NS_SWIFT_NAME(init(systemItem:));

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem
                                 handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(systemItem:handler:));

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem
                             initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer NS_SWIFT_NAME(init(systemItem:initializer:));

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem
                             initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer
                                 handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(systemItem:initializer:handler:));


+ (instancetype)kmy_buttonWithImage:(nullable UIImage *)image
                            handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(image:handler:));

+ (instancetype)kmy_buttonWithImage:(nullable UIImage *)image
                        initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer
                            handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(image:initializer:handler:));

+ (instancetype)kmy_buttonWithCustomView:(UIView *)view NS_SWIFT_NAME(init(customView:));

+ (instancetype)kmy_buttonWithFlexibleSpace NS_SWIFT_NAME(kmyWithFlexibleSpace());
+ (instancetype)kmy_buttonWithFixedSpace:(CGFloat)space NS_SWIFT_NAME(init(fixedSpace:));

- (instancetype)kmy_initWithTitle:(nullable NSString *)title
                            style:(UIBarButtonItemStyle)style
                          handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_UNAVAILABLE("");

- (instancetype)kmy_initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem
                                        handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_UNAVAILABLE("");

- (instancetype)kmy_initWithImage:(nullable UIImage *)image
                          handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_UNAVAILABLE("");

- (instancetype)kmy_initWithCustomView:(UIView *)view NS_SWIFT_UNAVAILABLE("");

/// May be modified after initialization.
@property (nonatomic, copy, nullable)   void (^kmy_actionHandler)(__kindof UIBarButtonItem *buttonItem) NS_SWIFT_NAME(kmyActionHandler);

@end

NS_ASSUME_NONNULL_END





























