//
//  KMYCollectionViewCellConfigurator.h
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMYUISection.h>
#import <KMYKit/KMYUIItem+CollectionView.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KMYCollectionViewCellConfigurator <NSObject>

/// Implementation should call the @c UICollectionView registerClass:withReuseIdentifier methods
- (void)registerClassesForCellReuseWithCollectionView:(UICollectionView *)collectionView;

- (NSString *)reuseIdentifierForItem:(KMYUIItem *)item;

/// Called by the data source after a cell has been dequeued.
- (void)configureCell:(UICollectionViewCell*)cell
             withItem:(KMYUIItem*)item
          atIndexPath:(NSIndexPath *)indexPath;

@end

@interface KMYCollectionViewCellConfigurator : NSObject <KMYCollectionViewCellConfigurator>

@property (nonatomic, copy, nullable)   NSString    *defaultCellReuseIdentifier;

@end

NS_ASSUME_NONNULL_END