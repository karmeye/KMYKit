//
//  KMYUIItem+CollectionView.m
//  KMYKit
//
//  Created on 26/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYUIItem+CollectionView.h"

NSString * const KMYUIItemKeyCollectionViewReuseIdentifier = @"KMYUIItemKeyCollectionViewReuseIdentifier";

@implementation KMYUIItem (CollectionView)

@dynamic collectionViewReuseIdentifier;

- (NSString *)collectionViewReuseIdentifier {
    return [self valueForAttribute:KMYUIItemKeyCollectionViewReuseIdentifier];
}

@end