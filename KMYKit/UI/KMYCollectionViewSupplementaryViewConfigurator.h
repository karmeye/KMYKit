//
//  KMYCollectionViewSupplementaryViewConfigurator.h
//  KMYKit
//
//  Created on 28/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMYUISection.h>
#import <KMYKit/KMYUIItem+CollectionView.h>
#import <KMYKit/KMYDefaultReusableIdentifying.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KMYCollectionViewSupplementaryViewConfigurating <NSObject>

- (void)registerClassesForSupplementaryViewsInCollectionView:(UICollectionView *)collectionView;

- (NSString *)supplementaryViewReuseIdentifierForItem:(KMYUIItem *)item inSection:(KMYUISection *)section ofKind:(NSString *)kind;

- (void)configureSupplementaryView:(UICollectionReusableView *)supplementaryView
                          withItem:(KMYUIItem *)item
                         inSection:(KMYUISection *)section
                            ofKind:(NSString *)kind
                       atIndexPath:(NSIndexPath *)indexPath;

@end

typedef void (^KMYCollectionViewSupplementaryViewConfiguratorHandler)(__kindof UICollectionReusableView *supplementaryView, __kindof KMYUISection *section, __kindof KMYUIItem *item, NSIndexPath *indexPath);

@interface KMYCollectionViewSupplementaryViewConfigurator : NSObject <KMYCollectionViewSupplementaryViewConfigurating>

@property (nonatomic, copy, nullable)   KMYCollectionViewSupplementaryViewConfiguratorHandler   configurationHandler;
@property (nonatomic, copy, nullable)   NSString                                                *defaultReuseIdentifier;

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls forSupplementaryViewOfKind:(NSString *)kind;
- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls forSupplementaryViewOfKind:(NSString *)kind handler:(nullable KMYCollectionViewSupplementaryViewConfiguratorHandler)handler;

- (void)registerClass:(Class)cls forSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:(NSString*)reuseIdentifier;
- (void)registerClass:(Class)cls forSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:(NSString*)reuseIdentifier handler:(nullable KMYCollectionViewSupplementaryViewConfiguratorHandler)handler;

@end

NS_ASSUME_NONNULL_END


















