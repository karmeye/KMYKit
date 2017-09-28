//
//  UILabel+KMY.m
//  KMYKit
//
//  Created on 2017-09-28.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import "UILabel+KMY.h"
#import "UIView+KMY.h"

@implementation UILabel (KMY)

+ (instancetype)kmy_labelWithInitializer:(void (^)(__kindof UILabel *label))initializer {
    return [[self class] kmy_viewWithInitializer:initializer];
}

+ (instancetype)kmy_labelWithFrame:(CGRect)frame initializer:(void (^)(__kindof UILabel *label))initializer {
    return [[self class] kmy_viewWithFrame:frame initializer:initializer];
}

@end
