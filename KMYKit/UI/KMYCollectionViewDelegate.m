//
//  KMYCollectionViewDelegate.m
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYCollectionViewDelegate.h"

@implementation KMYCollectionViewDelegate

- (instancetype)initWithSectionProvider:(id<KMYSectionProvider>)sectionProvider {
    self = [self init];
    if (self) {
        self.sectionProvider = sectionProvider;
    }
    return self;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

@end
