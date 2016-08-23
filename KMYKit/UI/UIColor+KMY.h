//
//  UIColor+KMY.h
//  KMYKit
//
//  Created on 15/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (KMY)

+ (instancetype)kmy_colorWithHex:(uint32_t)hex;
+ (instancetype)kmy_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

+ (instancetype)kmy_colorWithHexString:(NSString *)hexString;
+ (instancetype)kmy_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (instancetype)kmy_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;
+ (instancetype)kmy_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(uint8_t)alpha;

@end

NS_ASSUME_NONNULL_END