//
//  UIImage+KMY.h
//  KMYKit
//
//  Created on 06/09/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (KMY)

@property (nonatomic, assign, readonly)     CGSize          kmy_sizeInPixels NS_SWIFT_NAME(kmySizeInPixels);

- (CGSize)kmy_sizeThatAspectFitsSize:(CGSize)sizeToAspectFit NS_SWIFT_NAME(kmySizeThatAspectFits(_:));
+ (CGSize)kmy_sizeFromSize:(CGSize)fromSize thatAspectFitsSize:(CGSize)sizeToAspectFit NS_SWIFT_NAME(init(from:thatAspectFits:));

@end

NS_ASSUME_NONNULL_END
