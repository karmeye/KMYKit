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


+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem;

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem
                                 handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem
                             initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer;

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem
                             initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer
                                 handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;


+ (instancetype)kmy_buttonWithImage:(nullable UIImage *)image
                            handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;

+ (instancetype)kmy_buttonWithImage:(nullable UIImage *)image
                        initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer
                            handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;

+ (instancetype)kmy_buttonWithCustomView:(UIView *)view;

+ (instancetype)kmy_buttonWithFlexibleSpace;
+ (instancetype)kmy_buttonWithFixedSpace:(CGFloat)space;

- (instancetype)kmy_initWithTitle:(nullable NSString *)title
                            style:(UIBarButtonItemStyle)style
                          handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;

- (instancetype)kmy_initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem
                                        handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;

- (instancetype)kmy_initWithImage:(nullable UIImage *)image
                          handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;

- (instancetype)kmy_initWithCustomView:(UIView *)view;

/// May be modified after initialization.
@property (nonatomic, copy, nullable)   void (^kmy_actionHandler)(__kindof UIBarButtonItem *buttonItem);

@end

NS_ASSUME_NONNULL_END





























