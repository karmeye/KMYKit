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

+ (instancetype)kmy_imageViewWithInitializer:(void (^_Nullable)(__kindof UIImageView *imageView))initializer NS_SWIFT_NAME(init(initializer:));
+ (instancetype)kmy_imageViewWithImage:(nullable UIImage *)image initializer:(void (^_Nullable)(__kindof UIImageView *imageView))initializer NS_SWIFT_NAME(init(image:initializer:));

@end

NS_ASSUME_NONNULL_END
