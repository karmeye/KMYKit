//
//  KMYUIItem+CollectionView.h
//  KMYKit
//
//  Created on 26/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <KMYKit/KMYUISection.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString * const KMYUIItemKeyCollectionViewCellReuseIdentifier;
UIKIT_EXTERN NSString * const KMYUIItemKeyCollectionViewSupplementaryViewReuseIdentifier;

@interface KMYUISection (CollectionView)

@property (nonatomic, readonly, nullable)   NSString    *collectionViewSupplementaryViewReuseIdentifier;

@end

@interface KMYUIItem (CollectionView)

@property (nonatomic, readonly, nullable)   NSString    *collectionViewCellReuseIdentifier;
@property (nonatomic, readonly, nullable)   NSString    *collectionViewSupplementaryViewReuseIdentifier;

@end

NS_ASSUME_NONNULL_END