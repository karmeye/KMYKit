//
//  KMYCollectionViewControllerBehavior.h
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <KMYKit/KMYViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYCollectionViewControllerBehavior : NSObject <KMYViewControllerBehaving>

@property (nonatomic, strong, readonly) UICollectionView                    *collectionView;
@property (nonatomic, assign, readonly) BOOL                                isCollectionViewLoaded;

@property (nonatomic, weak, nullable)   id <UICollectionViewDataSource>     dataSource;
@property (nonatomic, weak, nullable)   id <UICollectionViewDelegate>       delegate;

/// Defaults to @YES
@property (nonatomic, assign)           BOOL                                automaticallyAddsCollectionView;

@property (nonatomic, weak, readonly, nullable)     UIViewController            *behavingViewController;
@property (nonatomic, strong, readonly, nullable)   UICollectionViewController  *collectionViewController;

/// Set dataSource, delegate and register reusable views here.
@property (nonatomic, copy, nullable)   void (^collectionViewDidLoad)(__kindof UICollectionView *);

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
