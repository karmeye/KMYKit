//
//  UIView+KMY.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (KMY)

+ (instancetype)kmy_view;

/// Calls initWithFrame:. Supports subclasses (UILabel etc.)
///
/// @param frame       Frame for initWithFrame:.
/// @param initializer Use to customize the newly allocated UIView.
///
/// @return A new UIView or subclass.
+ (instancetype)kmy_viewWithFrame:(CGRect)frame initializer:(void (^_Nullable)(__kindof UIView *view))initializer;

+ (instancetype)kmy_viewWithInitializer:(void (^_Nullable)(__kindof UIView *view))initializer;

@end

NS_ASSUME_NONNULL_END