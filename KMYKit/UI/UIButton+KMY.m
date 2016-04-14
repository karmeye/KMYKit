//
//  UIButton+KMY.m
//  KMYKit
//
//  Created on 14/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIButton+KMY.h"

@implementation UIButton (KMY)

+ (nullable instancetype)kmy_buttonWithType:(UIButtonType)buttonType initializer:(void (^_Nullable)(__kindof UIButton *button))initializer {
    UIButton *button = [[self class] buttonWithType:buttonType];
    if (button && initializer != NULL) initializer(button);
    return button;
}

@end
