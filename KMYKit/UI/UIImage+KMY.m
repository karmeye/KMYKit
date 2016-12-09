//
//  UIImage+KMY.m
//  KMYKit
//
//  Created on 06/09/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIImage+KMY.h"
#import "KMY+Foundation.h"

@implementation UIImage (KMY)

- (CGSize)kmy_sizeInPixels {
    return CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
}

- (CGSize)kmy_sizeThatAspectFitsSize:(CGSize)sizeToAspectFit {
    return [[self class] kmy_sizeFromSize:self.size thatAspectFitsSize:sizeToAspectFit];
}

+ (CGSize)kmy_sizeFromSize:(CGSize)fromSize thatAspectFitsSize:(CGSize)sizeToAspectFit {

    // Inspired by: https://github.com/quartermaster/QSKit/blob/master/Classes/Images/QSScaling.m

    CGFloat scaleFactor     = KMYScaleForSizeThatFitsSize(fromSize, sizeToAspectFit);
    CGSize scaledSize       = CGSizeZero;

    scaledSize.height       = ceil(fromSize.height / scaleFactor);
    scaledSize.width        = ceil(fromSize.width / scaleFactor);

    return scaledSize;
}

@end
