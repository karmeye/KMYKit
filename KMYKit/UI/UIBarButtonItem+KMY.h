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

+ (instancetype)kmy_buttonWithTitle:(NSString *)title NS_SWIFT_NAME(init(title:));
+ (instancetype)kmy_buttonWithTitle:(NSString *)title handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(title:handler:));
+ (instancetype)kmy_buttonWithTitle:(NSString *)title initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(title:initializer:handler:));
+ (instancetype)kmy_doneButtonWithTitle:(NSString *)title handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(title:handler:));
+ (instancetype)kmy_doneButtonWithTitle:(NSString *)title initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler NS_SWIFT_NAME(init(doneTitle:initializer:handler:));
+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
+ (instancetype)kmy_buttonWithImage:(UIImage *)image handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
+ (instancetype)kmy_buttonWithImage:(UIImage *)image initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
+ (instancetype)kmy_buttonWithCustomView:(UIView *)view;
+ (instancetype)kmy_buttonWithFlexibleSpace;
+ (instancetype)kmy_buttonWithFixedSpace:(CGFloat)space;

- (instancetype)kmy_initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
- (instancetype)kmy_initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
- (instancetype)kmy_initWithImage:(UIImage *)image handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
- (instancetype)kmy_initWithCustomView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
