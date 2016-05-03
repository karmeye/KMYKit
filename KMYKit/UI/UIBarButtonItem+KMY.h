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

+ (instancetype)kmy_buttonWithTitle:(NSString *)title;
+ (instancetype)kmy_buttonWithTitle:(NSString *)title handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
+ (instancetype)kmy_doneButtonWithTitle:(NSString *)title handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
+ (instancetype)kmy_buttonWithImage:(UIImage *)image handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
+ (instancetype)kmy_buttonWithCustomView:(UIView *)view;

- (instancetype)kmy_initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
- (instancetype)kmy_initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
- (instancetype)kmy_initWithImage:(UIImage *)image handler:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))handler;
- (instancetype)kmy_initWithCustomView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END