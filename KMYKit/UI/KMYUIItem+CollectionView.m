//
//  KMYUIItem+CollectionView.m
//  KMYKit
//
//  Created on 26/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYUIItem+CollectionView.h"

NSString * const KMYUIItemKeyCollectionViewCellReuseIdentifier              = @"KMYUIItemKeyCollectionViewCellReuseIdentifier";
NSString * const KMYUIItemKeyCollectionViewSupplementaryViewReuseIdentifier = @"KMYUIItemKeyCollectionViewSupplementaryViewReuseIdentifier";

@implementation KMYUISection (CollectionView)

@dynamic collectionViewSupplementaryViewReuseIdentifier;

- (NSString *)collectionViewSupplementaryViewReuseIdentifier {
    return [self valueForAttribute:KMYUIItemKeyCollectionViewSupplementaryViewReuseIdentifier];
}

@end

@implementation KMYUIItem (CollectionView)

@dynamic collectionViewCellReuseIdentifier;
@dynamic collectionViewSupplementaryViewReuseIdentifier;

- (NSString *)collectionViewCellReuseIdentifier {
    return [self valueForAttribute:KMYUIItemKeyCollectionViewCellReuseIdentifier];
}

- (NSString *)collectionViewSupplementaryViewReuseIdentifier {
    return [self valueForAttribute:KMYUIItemKeyCollectionViewSupplementaryViewReuseIdentifier];
}

@end