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
    return [[[self class] alloc] initWithFrame:CGRectZero];
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

+ (void)kmy_enableLayoutConstraintsOnViews:(NSArray<__kindof UIView *> *)views {
    for (UIView *view in views) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
}

@end

@implementation UIView (KMYViewHierarchy)

- (nullable __kindof UIView *)kmy_firstAncestorOfClass:(Class)cls {
    if (!self.superview) {
        return nil;
    } else if ([self.superview isMemberOfClass:cls]) {
        return self.superview;
    } else {
        return [self.superview kmy_firstAncestorOfClass:cls];
    }
}

@end




























