//
//  UICollectionViewController+KMY.h
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewController (KMY)

+ (instancetype)kmy_collectionViewWithLayout:(UICollectionViewLayout *)layout initializer:(void (^_Nullable)(__kindof UICollectionViewController *viewController))initializer;

@end

NS_ASSUME_NONNULL_END