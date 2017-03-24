//
//  KMYViewController.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMY+Foundation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KMYViewControllerBehaving <NSObject>

- (void)initializeBehaviorWithViewController:(__kindof UIViewController *)viewController;
- (void)behaviorLoadView;
- (void)behaviorViewControllerDidLoadView:(__kindof UIView *)view;

@end

@interface KMYViewController : UIViewController

@property (nonatomic, strong, readonly)     id <KMYViewControllerBehaving>                  behavior;
@property (nonatomic, strong, readonly)     NSArray<id <KMYViewControllerBehaving>>         *behaviors;

- (instancetype)initWithNibName:(nullable NSString *)nibName bundle:(nullable NSBundle *)bundle behavior:(nullable id <KMYViewControllerBehaving>)behavior;
- (nullable instancetype)initWithCoder:(NSCoder *)decoder behavior:(nullable id <KMYViewControllerBehaving>)behavior;

- (nullable instancetype)initWithBehavior:(nullable id <KMYViewControllerBehaving>)behavior;
- (nullable instancetype)initWithBehaviors:(nullable NSArray<id <KMYViewControllerBehaving>> *)behaviors;

@end

NS_ASSUME_NONNULL_END