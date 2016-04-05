//
//  UINavigationController+KMY.m
//  KMYKit
//
//  Created on 05/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UINavigationController+KMY.h"

@implementation UINavigationController (KMY)

+ (instancetype)kmy_initWithRootViewController:(UIViewController *)rootViewController initializer:(void (^)(UINavigationController *navigationController))initializer {
    id instance = [[[super class] alloc] initWithRootViewController:rootViewController];
    if (instance && initializer != NULL) initializer(instance);
    return instance;
}

@end
