//
//  UIImageView+KMY.m
//  KMYKit
//
//  Created on 14/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIImageView+KMY.h"

@implementation UIImageView (KMY)

+ (instancetype)kmy_viewWithImage:(UIImage *)image initializer:(void (^)(__kindof UIImageView *imageView))initializer {
    UIImageView *imageView = [[[self class] alloc] initWithImage:image];
    if (initializer != NULL) initializer(imageView);
    return imageView;
}

@end
