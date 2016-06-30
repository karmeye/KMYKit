//
//  KMYTableViewHeaderFooterConfigurator.h
//  KMYKit
//
//  Created on 30/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMY+Foundation.h>
#import <KMYKit/KMYDefaultReusableIdentifying.h>
#import <KMYKit/KMYUISection.h>
#import <KMYKit/KMYUIItem+TableView.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString * const KMYTableViewKindSectionHeader;
UIKIT_EXTERN NSString * const KMYTableViewKindSectionFooter;

@protocol KMYTableViewHeaderFooterConfigurating <NSObject>

- (void)registerClassesForHeaderFooterReuseWithTableView:(UITableView *)tableView;

- (NSString *)headerReuseIdentifierForSection:(KMYUISection *)section;
- (NSString *)footerReuseIdentifierForSection:(KMYUISection *)section;

- (void)configureHeaderView:(UITableViewHeaderFooterView *)headerView
                withSection:(KMYUISection *)section
             atSectionIndex:(NSInteger)sectionIndex;

- (void)configureFooterView:(UITableViewHeaderFooterView *)headerView
                withSection:(KMYUISection *)section
             atSectionIndex:(NSInteger)sectionIndex;

@end

typedef void (^KMYTableViewHeaderFooterConfiguratorHandler)(__kindof UITableViewHeaderFooterView *view, __kindof KMYUISection *section, NSInteger sectionIndex);

@interface KMYTableViewHeaderFooterConfigurator : NSObject <KMYTableViewHeaderFooterConfigurating>

@property (nonatomic, copy, nullable)   NSString        *defaultHeaderReuseIdentifier;
@property (nonatomic, copy, nullable)   NSString        *defaultFooterReuseIdentifier;

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls forHeaderViewWithHandler:(KMYTableViewHeaderFooterConfiguratorHandler)handler;
- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls forFooterViewWithHandler:(KMYTableViewHeaderFooterConfiguratorHandler)handler;
- (void)registerClass:(Class)cls ofKind:(NSString *)kind withReuseIdentifier:(NSString*)reuseIdentifier handler:(KMYTableViewHeaderFooterConfiguratorHandler)handler;

@end

NS_ASSUME_NONNULL_END



























