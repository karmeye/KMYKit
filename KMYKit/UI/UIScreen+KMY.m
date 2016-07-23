//
//  UIScreen+KMY.m
//  KMYKit
//
//  Created on 23/07/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIScreen+KMY.h"

CGFloat KMYMainScreenDisplayScale() {
    static CGFloat mainScreenDisplayScale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainScreenDisplayScale = [UIScreen mainScreen].scale;
    });
    return mainScreenDisplayScale;
}

@implementation UIScreen (KMY)

@end
