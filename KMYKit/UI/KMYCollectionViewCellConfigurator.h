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

- (NSString *)reuseIdentifierForItem:(__kindof KMYUIItem *)item;

/// Called by the data source after a cell has been dequeued.
- (void)configureCell:(__kindof UICollectionViewCell *)cell
             withItem:(__kindof KMYUIItem *)item
          atIndexPath:(NSIndexPath *)indexPath;

@end

typedef void (^KMYCollectionViewCellConfiguratorCellConfigurationHandler)(__kindof UICollectionViewCell *cell, __kindof KMYUIItem *item, NSIndexPath *indexPath);

@interface KMYCollectionViewCellConfigurator : NSObject <KMYCollectionViewCellConfigurating>

/// Called for all cells after the specific config set by one of the `registerClass:` methods.
@property (nonatomic, copy, nullable)           KMYCollectionViewCellConfiguratorCellConfigurationHandler   cellConfigurationHandler;

/// Defaults to KMYDefaultCollectionViewCell
@property (nonatomic, copy, null_resettable)    NSString                                                    *defaultCellReuseIdentifier;

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls;
- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls configurationHandler:(nullable KMYCollectionViewCellConfiguratorCellConfigurationHandler)handler;
- (void)registerClass:(Class)cls withReuseIdentifier:(NSString *)reuseIdentifier;
- (void)registerClass:(Class)cls withReuseIdentifier:(NSString *)reuseIdentifier configurationHandler:(nullable KMYCollectionViewCellConfiguratorCellConfigurationHandler)handler;

@end

NS_ASSUME_NONNULL_END




























