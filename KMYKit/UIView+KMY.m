//
//  UIView+KMY.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIView+KMY.h"

@implementation UIView (KMY)

+ (instancetype)kmy_initWithFrame:(CGRect)frame initializer:(void (^)(UIView *view))initializer {

    UIView *view = [[[self class] alloc] initWithFrame:frame];
    if (view && initializer != NULL) initializer(view);
    
    return view;
}

@end
