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

+ (nullable instancetype)kmy_navigationControllerWithRootViewController:(UIViewController *)rootViewController NS_SWIFT_NAME(init(rootViewController:));
+ (nullable instancetype)kmy_navigationControllerWithRootViewController:(UIViewController *)rootViewController initializer:(void (^_Nullable)(__kindof UINavigationController *navigationController))initializer NS_SWIFT_NAME(init(rootViewController:initializer:));

/// @note Uses the @c animateAlongsideTransition:completion: method from the pushed view controllers’s @c transitionCoordinator in order to know when the transition has completed.
- (void)kmy_pushViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion NS_SWIFT_NAME(kmyPushViewController(_:animated:completion:));

/// @note Uses the @c animateAlongsideTransition:completion: method from the top view controllers’s @c transitionCoordinator in order to know when the transition has completed.
- (void)kmy_popViewControllerAnimated:(BOOL)animated completion:(void (^ _Nullable)(void))completion NS_SWIFT_NAME(kmyPopViewController(animated:completion:));;

@end

NS_ASSUME_NONNULL_END
