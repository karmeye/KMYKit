//
//  UINavigationController+KMY.m
//  KMYKit
//
//  Created on 05/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UINavigationController+KMY.h"

@implementation UINavigationController (KMY)

+ (instancetype)kmy_navigationControllerWithRootViewController:(UIViewController *)rootViewController {
    return [[self class] kmy_navigationControllerWithRootViewController:rootViewController initializer:NULL];
}

+ (instancetype)kmy_navigationControllerWithRootViewController:(UIViewController *)rootViewController initializer:(void (^)(__kindof UINavigationController *navigationController))initializer {
    UINavigationController *navigationController = [[[super class] alloc] initWithRootViewController:rootViewController];
    if (navigationController && initializer != NULL) initializer(navigationController);
    return navigationController;
}

@end
