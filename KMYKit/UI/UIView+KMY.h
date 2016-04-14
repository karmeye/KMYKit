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

/// Calls initWithFrame:. Supports subclasses (UILabel etc.)
///
/// @param frame       Frame for initWithFrame:.
/// @param initializer Use to customize the newly allocated UIView.
///
/// @return A new UIView or subclass.
+ (nullable instancetype)kmy_initWithFrame:(CGRect)frame initializer:(void (^)(__kindof UIView *view))initializer;

@end

NS_ASSUME_NONNULL_END