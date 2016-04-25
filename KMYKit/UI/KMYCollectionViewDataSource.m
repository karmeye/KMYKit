//
//  KMYCollectionViewDataSource.m
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYCollectionViewDataSource.h"

@implementation KMYCollectionViewDataSource

- (instancetype)initWithSectionProvider:(id<KMYSectionProvider>)sectionProvider {
    self = [self init];
    if (self) {
        self.sectionProvider = sectionProvider;
    }
    return self;
}

#pragma mark - Public -

- (id<KMYCollectionViewCellConfigurator>)cellConfigurator {
    if (!_cellConfigurator) _cellConfigurator = [[KMYCollectionViewCellConfigurator alloc] init];
    return _cellConfigurator;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionProvider.sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sectionProvider.sections[section].numberOfItems;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KMYUIItem *item = self.sectionProvider.sections[indexPath.section].items[indexPath.row];
    KMYAssert(item.reuseIdentifier, @"Missing reuse identifier for item: %@", item);

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:item.reuseIdentifier forIndexPath:indexPath];
    KMYAssert(cell, @"No cell was registered with reuse identifier: %@", item.reuseIdentifier);

    [self.cellConfigurator configureCell:cell withItem:item atIndexPath:indexPath];

    return cell;
}

@end
