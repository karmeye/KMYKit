//
//  KMYTableViewCellConfigurator.h
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMY+Foundation.h>
#import <KMYKit/KMYUISection.h>
#import <KMYKit/KMYUIItem+TableView.h>
#import <KMYKit/KMYDefaultReusableIdentifying.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KMYTableViewCellConfigurating <NSObject>

/// Implementation should call the @c UITableView registerClass:withReuseIdentifier methods
- (void)registerClassesForCellReuseWithTableView:(UITableView *)tableView;

- (NSString *)reuseIdentifierForItem:(KMYUIItem *)item;

/// Is called by the data source after a cell has been dequeued.
- (void)configureCell:(UITableViewCell *)cell
             withItem:(KMYUIItem *)item
          atIndexPath:(NSIndexPath *)indexPath;

@end

typedef void (^KMYTableViewCellConfiguratorCellConfigurationHandler)(__kindof UITableViewCell *cell, __kindof KMYUIItem *item, NSIndexPath *indexPath);

/// Default cell configurator
@interface KMYTableViewCellConfigurator : NSObject<KMYTableViewCellConfigurating>

/// Called for all cells after specific config
@property (nonatomic, copy, nullable)   KMYTableViewCellConfiguratorCellConfigurationHandler    cellConfigurationHandler;

/// Defaults to KMYDefaultStyleTableViewCell
@property (nonatomic, copy, nullable)   NSString                                                *defaultCellReuseIdentifier;

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls;
- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls configurationHandler:(nullable KMYTableViewCellConfiguratorCellConfigurationHandler)handler;
- (void)registerClass:(Class)cls withReuseIdentifier:(NSString *)reuseIdentifier;
- (void)registerClass:(Class)cls withReuseIdentifier:(NSString *)reuseIdentifier configurationHandler:(nullable KMYTableViewCellConfiguratorCellConfigurationHandler)handler;

@end

NS_ASSUME_NONNULL_END