//
//  KMYUIItem+CollectionView.h
//  KMYKit
//
//  Created on 26/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <KMYKit/KMYUIItem.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const KMYUIItemKeyCollectionViewReuseIdentifier;

@interface KMYUIItem (CollectionView)

@property (nonatomic, readonly, nullable)   NSString    *collectionViewReuseIdentifier;

@end

NS_ASSUME_NONNULL_END