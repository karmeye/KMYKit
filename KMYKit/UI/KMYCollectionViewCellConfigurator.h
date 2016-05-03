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
#import <KMYKit/KMYDefaultReusableIdentifying.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KMYCollectionViewCellConfigurating <NSObject>

/// Implementation should call the @c UICollectionView registerClass:withReuseIdentifier methods
- (void)registerClassesForCellReuseWithCollectionView:(UICollectionView *)collectionView;

- (NSString *)reuseIdentifierForItem:(KMYUIItem *)item;

/// Called by the data source after a cell has been dequeued.
- (void)configureCell:(UICollectionViewCell*)cell
             withItem:(KMYUIItem*)item
          atIndexPath:(NSIndexPath *)indexPath;

@end

typedef void (^KMYCollectionViewCellConfiguratorCellConfigurationHandler)(__kindof UICollectionViewCell *cell, __kindof KMYUIItem *item, NSIndexPath *indexPath);

@interface KMYCollectionViewCellConfigurator : NSObject <KMYCollectionViewCellConfigurating>

/// Called for all cells after specific config
@property (nonatomic, copy, nullable)   KMYCollectionViewCellConfiguratorCellConfigurationHandler   cellConfigurationHandler;
@property (nonatomic, copy, nullable)   NSString                                                    *defaultCellReuseIdentifier;

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls;
- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls configurationHandler:(nullable KMYCollectionViewCellConfiguratorCellConfigurationHandler)handler;
- (void)registerClass:(Class)cls withReuseIdentifier:(NSString *)reuseIdentifier;
- (void)registerClass:(Class)cls withReuseIdentifier:(NSString *)reuseIdentifier configurationHandler:(nullable KMYCollectionViewCellConfiguratorCellConfigurationHandler)handler;

@end

NS_ASSUME_NONNULL_END