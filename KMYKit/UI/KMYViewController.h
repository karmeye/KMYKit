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
@optional

- (void)initializeWithParentController:(__kindof UIViewController *)parentViewController;
- (void)loadViewWithParentViewController:(__kindof UIViewController *)parentViewController;
- (void)parentViewControllerDidLoadView:(__kindof UIViewController *)parentViewController;

@end

@interface KMYViewController : UIViewController

@property (nonatomic, strong, readonly)     id <KMYViewControllerBehaving>                  behavior;
@property (nonatomic, copy, readonly)       NSArray<id <KMYViewControllerBehaving>>         *behaviors;

- (instancetype)initWithNibName:(nullable NSString *)nibName bundle:(nullable NSBundle *)bundle behavior:(id <KMYViewControllerBehaving>)behavior;
- (nullable instancetype)initWithCoder:(NSCoder *)decoder behavior:(id <KMYViewControllerBehaving>)behavior;

- (nullable instancetype)initWithBehavior:(id <KMYViewControllerBehaving>)behavior;
- (nullable instancetype)initWithBehaviors:(NSArray<id <KMYViewControllerBehaving>> *)behaviors;

@end

NS_ASSUME_NONNULL_END