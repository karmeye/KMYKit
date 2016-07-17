//
//  UIButton+KMY.h
//  KMYKit
//
//  Created on 14/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (KMY)

@property (nonatomic, copy, nullable)   void (^kmy_touchUpInsideHandler)(__kindof UIButton *button);

+ (nullable instancetype)kmy_buttonWithType:(UIButtonType)buttonType initializer:(void (^_Nullable)(__kindof UIButton *button))initializer;

@end

NS_ASSUME_NONNULL_END