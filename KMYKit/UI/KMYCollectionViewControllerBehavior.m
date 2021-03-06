//
//  KMYCollectionViewControllerBehavior.m
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYCollectionViewControllerBehavior.h"
#import "UICollectionViewController+KMY.h"
#import "NSLayoutConstraint+KMY.h"

@interface KMYCollectionViewControllerBehavior ()

@property (nonatomic, strong)                       UICollectionViewLayout          *layout;
@property (nonatomic, strong, readwrite, nullable)  UICollectionViewController      *collectionViewController;
@property (nonatomic, weak, readwrite, nullable)    UIViewController                *behavingViewController;

@end

@implementation KMYCollectionViewControllerBehavior

@dynamic collectionView, isCollectionViewLoaded;

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    self                                    = [super init];
    self.layout                             = layout;
    self.automaticallyAddsCollectionView    = YES;

    return self;
}

- (UICollectionView*)collectionView {
    KMYAssert(self.collectionViewController);
    return self.collectionViewController.collectionView;
}

- (BOOL)isCollectionViewLoaded {
    KMYAssert(self.collectionViewController);
    return [self.collectionViewController isViewLoaded];
}

- (void)reloadData {
    if (self.isCollectionViewLoaded) {
        [self.collectionView reloadData];
    }
}

#pragma mark - KMYViewControllerBehaving protocol

- (void)initializeBehaviorWithViewController:(__kindof UIViewController *)viewController {
    self.behavingViewController = viewController;
    self.collectionViewController = [UICollectionViewController kmy_collectionViewWithLayout:self.layout initializer:^(UICollectionViewController *collectionViewController) {
        [viewController addChildViewController:collectionViewController];
        [collectionViewController didMoveToParentViewController:viewController];
    }];
}

- (void)deinitializeBehaviorWithViewController:(__kindof UIViewController *)viewController {
    [self.collectionViewController willMoveToParentViewController:nil];
    [self.collectionViewController removeFromParentViewController];

    self.behavingViewController = nil;
    self.collectionViewController = nil;
}


- (void)behaviorViewControllerLoadView {
    if (self.automaticallyAddsCollectionView) {
        UIView *parentView = self.behavingViewController.view;
        UIView *childView = self.collectionViewController.view;

        [parentView addSubview:childView];
        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint kmy_constraintsForView:childView equalToEdgesOfView:parentView]];

        self.collectionView.delegate    = self.delegate;
        self.collectionView.dataSource  = self.dataSource;
    }
}

- (void)behaviorViewControllerDidLoadView:(__kindof UIView *)view {
    KMYInvokeBlockIfSet(self.collectionViewDidLoad, self.collectionView);
}

@end



































