//
//  UIImageView+KMY.h
//  KMYKit
//
//  Created on 14/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (KMY)

+ (nullable instancetype)kmy_viewWithImage:(nullable UIImage *)image initializer:(void (^_Nullable)(__kindof UIImageView *imageView))initializer;

@end

NS_ASSUME_NONNULL_END