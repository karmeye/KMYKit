//
//  UIView+KMY.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIView+KMY.h"

@implementation UIView (KMY)

+ (instancetype)kmy_view {
    return [[self class] kmy_viewWithInitializer:NULL];
}

+ (instancetype)kmy_viewWithFrame:(CGRect)frame initializer:(void (^)(__kindof UIView *view))initializer {
    UIView *view = [[[self class] alloc] initWithFrame:frame];
    if (initializer != NULL) initializer(view);
    return view;
}

+ (instancetype)kmy_viewWithInitializer:(void (^)(__kindof UIView *view))initializer {
    return [[self class] kmy_viewWithFrame:CGRectZero initializer:initializer];
}

@end
