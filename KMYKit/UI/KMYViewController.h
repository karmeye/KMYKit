//
//  KMYViewController.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

@import UIKit;
#import "KMY+Foundation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KMYViewControllerBehaving <NSObject>

- (void)initializeBehaviorWithViewController:(__kindof UIViewController *)viewController;
- (void)deinitializeBehaviorWithViewController:(__kindof UIViewController *)viewController;
- (void)behaviorViewControllerLoadView;
- (void)behaviorViewControllerDidLoadView:(__kindof UIView *)view;

@end

@interface KMYViewController : UIViewController

@property (nonatomic, copy, readonly)   NSArray<id<KMYViewControllerBehaving>>  *behaviors;

- (instancetype)initWithNibName:(nullable NSString *)nibName
                         bundle:(nullable NSBundle *)bundle
                       behaviors:(nullable NSArray<id<KMYViewControllerBehaving>> *)behaviors;

- (nullable instancetype)initWithCoder:(NSCoder *)decoder
                              behaviors:(nullable NSArray<id<KMYViewControllerBehaving>> *)behaviors;

- (instancetype)initWithBehavior:(nullable id<KMYViewControllerBehaving>)behavior;
- (instancetype)initWithBehaviors:(nullable NSArray<id<KMYViewControllerBehaving>> *)behaviors;

- (void)addBehavior:(id<KMYViewControllerBehaving>)behavior;
- (void)addBehaviors:(NSArray<id<KMYViewControllerBehaving>> *)behaviors;
- (void)removeBehavior:(id<KMYViewControllerBehaving>)behavior;
- (void)removeBehaviors:(NSArray<id<KMYViewControllerBehaving>> *)behaviors;

@end

NS_ASSUME_NONNULL_END
