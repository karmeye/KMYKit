//
//  UIColor+KMY.m
//  KMYKit
//
//  Created on 15/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIColor+KMY.h"

@implementation UIColor (KMY)

+ (instancetype)kmy_colorWithHex:(uint32_t)hex {
    return [[self class] kmy_colorWithHex:hex alpha:1.0f];
}

+ (instancetype)kmy_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:(CGFloat)((hex) >> 16 & 0xff) / 0xff
                           green:(CGFloat)((hex) >> 8  & 0xff) / 0xff
                            blue:(CGFloat)((hex)       & 0xff) / 0xff
                           alpha:alpha];
}

+ (instancetype)kmy_colorWithHexString:(NSString *)hexString {
    return [[self class] kmy_colorWithHexString:hexString alpha:1.0f];
}

+ (instancetype)kmy_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {

    unsigned int hex = 0;

    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hex];

    // FFFFFF
    if (hex > 16777215) {
        hex = 16777215;
    }

    return [[self class] kmy_colorWithHex:hex alpha:alpha];
}

+ (instancetype)kmy_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue {
    return [[self class] kmy_colorWithRed:red green:green blue:blue alpha:255];
}

+ (instancetype)kmy_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(uint8_t)alpha {
    return [[self class] colorWithRed:(CGFloat)red      / 0xff
                                green:(CGFloat)green    / 0xff
                                 blue:(CGFloat)blue     / 0xff
                                alpha:(CGFloat)alpha    / 0xff];
}

@end
