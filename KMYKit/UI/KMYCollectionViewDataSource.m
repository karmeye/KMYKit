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

- (instancetype)initWithSectionProvider:(nullable id<KMYSectionProvider>)sectionProvider cellConfigurator:(nullable id<KMYCollectionViewCellConfigurating>)cellConfigurator {
    self = [self initWithSectionProvider:sectionProvider];
    if (self) {
        self.cellConfigurator = cellConfigurator;
    }
    return self;
}

#pragma mark - Public -

- (id<KMYCollectionViewCellConfigurating>)cellConfigurator {
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

    KMYUIItem *item = self.sectionProvider.sections[indexPath.section].items[indexPath.item];
    NSString *reuseIdentifier = [self.cellConfigurator reuseIdentifierForItem:item];
    KMYAssert(reuseIdentifier, @"Missing reuse identifier for item: %@", item);

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    KMYAssert(cell, @"No cell was registered with reuse identifier: %@", reuseIdentifier);
    [self.cellConfigurator configureCell:cell withItem:item atIndexPath:indexPath];

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    KMYUISection *section       = self.sectionProvider.sections[indexPath.section];
    KMYUIItem *item             = section.items[indexPath.item];
    NSString *reuseIdentifier   = [self.supplementaryViewConfigurator supplementaryViewReuseIdentifierForItem:item inSection:section ofKind:kind];
    KMYAssert(reuseIdentifier, @"Missing reuse identifier for supplementaryView: %@", item);

    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (view) [self.supplementaryViewConfigurator configureSupplementaryView:view withItem:item inSection:section ofKind:kind atIndexPath:indexPath];

    return view;
}

@end
















