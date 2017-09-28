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

+ (instancetype)kmy_buttonWithType:(UIButtonType)buttonType
                       initializer:(void (^_Nullable)(__kindof UIButton *button))initializer NS_SWIFT_NAME(init(type:initializer:));

+ (instancetype)kmy_buttonWithType:(UIButtonType)buttonType
                       initializer:(void (^_Nullable)(__kindof UIButton *button))initializer
                           handler:(void (^_Nullable)(__kindof UIButton *button))handler NS_SWIFT_NAME(init(type:initializer:handler:));

/// May be modified after initialization.
@property (nonatomic, copy, nullable) void (^kmy_touchUpInsideHandler)(__kindof UIButton *button);

@end

NS_ASSUME_NONNULL_END
