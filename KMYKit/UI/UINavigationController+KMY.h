//
//  UINavigationController+KMY.h
//  KMYKit
//
//  Created on 05/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (KMY)

+ (nullable instancetype)kmy_initWithRootViewController:(UIViewController *)rootViewController initializer:(void (^)(UINavigationController *navigationController))initializer;

@end

NS_ASSUME_NONNULL_END