//
//  UITextField+KMY.m
//  KMYKit
//
//  Created on 2017-09-28.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import "UITextField+KMY.h"
#import "UIView+KMY.h"

@implementation UITextField (KMY)

+ (instancetype)kmy_textFieldWithInitializer:(void (^)(__kindof UITextField *textField))initializer {
    return [[self class] kmy_viewWithInitializer:initializer];
}

+ (instancetype)kmy_textFieldWithFrame:(CGRect)frame initializer:(void (^)(__kindof UITextField *textField))initializer {
    return [[self class] kmy_viewWithFrame:frame initializer:initializer];
}

@end
