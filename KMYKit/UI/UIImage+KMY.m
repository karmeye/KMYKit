//
//  UIImage+KMY.m
//  KMYKit
//
//  Created on 06/09/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIImage+KMY.h"

@implementation UIImage (KMY)

- (CGSize)kmy_sizeInPixels {
    return CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
}

@end
