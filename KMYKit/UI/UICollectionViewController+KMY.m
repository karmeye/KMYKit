//
//  UICollectionViewController+KMY.m
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UICollectionViewController+KMY.h"

@implementation UICollectionViewController (KMY)

+ (instancetype)kmy_collectionViewWithLayout:(UICollectionViewLayout *)layout initializer:(void (^_Nullable)(__kindof UICollectionViewController *viewController))initializer {
    UICollectionViewController *viewController = [[[self class] alloc] initWithCollectionViewLayout:layout];
    if (viewController && initializer != NULL) initializer(viewController);
    return viewController;
}

@end
