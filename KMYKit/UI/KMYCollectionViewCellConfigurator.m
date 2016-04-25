//
//  KMYCollectionViewCellConfigurator.m
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYCollectionViewCellConfigurator.h"
#import "KMYDefaultCollectionViewCell.h"

@implementation KMYCollectionViewCellConfigurator

#pragma mark - KMYCollectionViewCellConfigurator Protocol

- (void)registerClassesForCellReuseWithCollectionView:(UICollectionView *)collectionView {
    KMYAssert(collectionView);

    [collectionView registerClass:[KMYDefaultCollectionViewCell class] forCellWithReuseIdentifier:[KMYDefaultCollectionViewCell defaultReuseIdentifier]];
}

- (void)configureCell:(UICollectionViewCell*)cell withItem:(KMYUIItem*)item atIndexPath:(NSIndexPath *)indexPath {

}

@end
