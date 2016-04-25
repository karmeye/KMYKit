//
//  KMYCollectionViewControllerBehavior.m
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYCollectionViewControllerBehavior.h"
#import "UICollectionViewController+KMY.h"

@interface KMYCollectionViewControllerBehavior ()

@property (nonatomic, strong)       UICollectionViewLayout              *layout;
@property (nonatomic, strong)       UICollectionViewController          *collectionViewController;

@end

@implementation KMYCollectionViewControllerBehavior

@dynamic collectionView;

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super init];
    if (self) {
        self.layout = layout;
    }
    return self;
}

- (UICollectionView*)collectionView {
    return self.collectionViewController.collectionView;
}

- (void)reloadData {
    if ([self.collectionViewController isViewLoaded]) [self.collectionView reloadData];
}

- (void)initializeWithParentController:(UIViewController *)parentViewController {
    self.collectionViewController = [UICollectionViewController kmy_collectionViewWithLayout:self.layout initializer:^(UICollectionViewController *viewController) {
        [parentViewController addChildViewController:viewController];
        [viewController didMoveToParentViewController:parentViewController];
    }];
}

- (void)loadViewWithParentViewController:(UIViewController *)parentViewController {

    UICollectionView *collectionView    = self.collectionView;
    collectionView.frame                = parentViewController.view.bounds;
    collectionView.autoresizingMask     = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    collectionView.delegate             = self.delegate;
    collectionView.dataSource           = self.dataSource;

    [parentViewController.view addSubview:collectionView];
}

- (void)parentViewControllerDidLoadView:(UIViewController *)parentViewController {
    KMYInvokeBlockIfSet(self.collectionViewDidLoad, self.collectionView);
}

@end





































