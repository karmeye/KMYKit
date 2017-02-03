//
//  UIToolbar+KMY.m
//  KMYKit
//
//  Created on 2017-02-03.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import "UIToolbar+KMY.h"
#import "UIView+KMY.h"

@implementation UIToolbar (KMY)

@dynamic kmy_defaultHeight;

+ (CGFloat)kmy_defaultHeight {
    static CGFloat height;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIToolbar *toolbar = [UIToolbar kmy_view];
        [toolbar sizeToFit];
        height = CGRectGetHeight(toolbar.bounds);
    });
    return height;
}

@end
