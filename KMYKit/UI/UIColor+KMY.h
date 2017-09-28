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


/**
 Creates a new color from the given hex representation.
 @param hex For example: 0x006F51
 */
+ (instancetype)kmy_colorWithHex:(uint32_t)hex NS_SWIFT_NAME(kmyColor(hex:));
+ (instancetype)kmy_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha NS_SWIFT_NAME(kmyColor(hex:alpha:));

+ (instancetype)kmy_colorWithHexString:(NSString *)hexString NS_SWIFT_NAME(kmyColor(hexString:));
+ (instancetype)kmy_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha NS_SWIFT_NAME(kmyColor(hexString:alpha:));

+ (instancetype)kmy_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue NS_SWIFT_NAME(kmyColor(red:green:blue:));
+ (instancetype)kmy_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(uint8_t)alpha NS_SWIFT_NAME(kmyColor(red:green:blue:alpha:));

@end

NS_ASSUME_NONNULL_END
