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

@implementation UIView (KMYUIConstraintBasedLayoutLayering)

- (void)kmy_setLayoutTradeoff:(KMYLayoutTradeoff)tradeoff priority:(UILayoutPriority)priority forAxis:(KMYLayoutAxis)axis {
    if (tradeoff & KMYLayoutTradeoffCompressionResistance) {
        if (axis & KMYLayoutConstraintAxisVertical)   [self setContentCompressionResistancePriority:priority forAxis:UILayoutConstraintAxisVertical];
        if (axis & KMYLayoutConstraintAxisHorizontal) [self setContentCompressionResistancePriority:priority forAxis:UILayoutConstraintAxisHorizontal];
    }
    if (tradeoff & KMYLayoutTradeoffHugging) {
        if (axis & KMYLayoutConstraintAxisVertical)   [self setContentHuggingPriority:priority forAxis:UILayoutConstraintAxisVertical];
        if (axis & KMYLayoutConstraintAxisHorizontal) [self setContentHuggingPriority:priority forAxis:UILayoutConstraintAxisHorizontal];
    }
}

+ (void)kmy_enableLayoutConstraintsOnViews:(NSArray<UIView *> *)views {
    for (UIView *view in views) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
}

@end




































