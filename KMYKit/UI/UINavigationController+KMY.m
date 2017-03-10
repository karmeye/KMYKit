//
//  UINavigationController+KMY.m
//  KMYKit
//
//  Created on 05/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UINavigationController+KMY.h"
#import "KMY+Foundation.h"

@implementation UINavigationController (KMY)

+ (instancetype)kmy_navigationControllerWithRootViewController:(UIViewController *)rootViewController {
    return [[self class] kmy_navigationControllerWithRootViewController:rootViewController initializer:NULL];
}

+ (instancetype)kmy_navigationControllerWithRootViewController:(UIViewController *)rootViewController initializer:(void (^)(__kindof UINavigationController *navigationController))initializer {
    UINavigationController *navigationController = [[[super class] alloc] initWithRootViewController:rootViewController];
    if (navigationController && initializer != NULL) initializer(navigationController);
    return navigationController;
}

- (void)kmy_pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion {
    [self pushViewController:viewController animated:animated];

    if (animated) {
        id<UIViewControllerTransitionCoordinator> coordinator = viewController.transitionCoordinator;
        [coordinator animateAlongsideTransition:NULL completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            KMYInvokeBlockIfSet(completion);
        }];
    } else {
        KMYInvokeBlockIfSet(completion);
    }
}

- (void)kmy_popViewControllerAnimated:(BOOL)animated completion:(void (^ _Nullable)(void))completion {
    [self popViewControllerAnimated:animated];

    if (animated) {
        id<UIViewControllerTransitionCoordinator> coordinator = self.topViewController.transitionCoordinator;
        [coordinator animateAlongsideTransition:NULL completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            KMYInvokeBlockIfSet(completion);
        }];
    } else {
        KMYInvokeBlockIfSet(completion);
    }
}

@end
