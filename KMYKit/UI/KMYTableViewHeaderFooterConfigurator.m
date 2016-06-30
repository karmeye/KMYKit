//
//  KMYTableViewHeaderFooterConfigurator.m
//  KMYKit
//
//  Created on 30/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewHeaderFooterConfigurator.h"

NSString * const KMYTableViewKindSectionHeader = @"KMYTableViewKindSectionHeader";
NSString * const KMYTableViewKindSectionFooter = @"KMYTableViewKindSectionFooter";

@interface KMYTableViewHeaderFooterConfiguratorReuseInfo :  NSObject

@property (nonatomic, copy)     Class                                           cls;
@property (nonatomic, copy)     NSString                                        *kind;
@property (nonatomic, copy)     NSString                                        *reuseIdentifier;
@property (nonatomic, copy)     KMYTableViewHeaderFooterConfiguratorHandler     handler;

@end

@implementation KMYTableViewHeaderFooterConfiguratorReuseInfo
@end

#pragma mark -

@interface KMYTableViewHeaderFooterConfigurator ()

@property (nonatomic, strong)   NSMutableDictionary     *reuseInfo;

@end

@implementation KMYTableViewHeaderFooterConfigurator

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls forHeaderViewWithHandler:(KMYTableViewHeaderFooterConfiguratorHandler)handler {
    [self registerClass:cls ofKind:KMYTableViewKindSectionHeader withReuseIdentifier:[cls defaultReuseIdentifier] handler:handler];
}

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls forFooterViewWithHandler:(KMYTableViewHeaderFooterConfiguratorHandler)handler {
    [self registerClass:cls ofKind:KMYTableViewKindSectionFooter withReuseIdentifier:[cls defaultReuseIdentifier] handler:handler];
}

- (void)registerClass:(Class)cls ofKind:(NSString *)kind withReuseIdentifier:(NSString*)reuseIdentifier handler:(KMYTableViewHeaderFooterConfiguratorHandler)handler {
    KMYAssert(kind);
    KMYAssert(reuseIdentifier);
    KMYAssert(cls);

    NSString * const reuseInfoKey = [self reuseInfoKeyFromIdentifier:reuseIdentifier kind:kind];
    KMYAssert(!_reuseInfo || (_reuseInfo && !_reuseInfo[reuseInfoKey]), @"This reuse identifier is already registered: %@", reuseIdentifier);

    self.reuseInfo[reuseInfoKey] = [KMYTableViewHeaderFooterConfiguratorReuseInfo kmy_objectWithInitializer:^(KMYTableViewHeaderFooterConfiguratorReuseInfo *info) {
        info.cls                = cls;
        info.kind               = kind;
        info.reuseIdentifier    = reuseIdentifier;
        info.handler            = handler;
    }];
}

#pragma mark - KMYTableViewHeaderFooterConfigurating Protocol

- (NSString *)headerReuseIdentifierForSection:(KMYUISection *)section {
    return section.tableViewHeaderReuseIdentifier ?: self.defaultHeaderReuseIdentifier;
}

- (NSString *)footerReuseIdentifierForSection:(KMYUISection *)section {
    return section.tableViewFooterReuseIdentifier ?: self.defaultFooterReuseIdentifier;
}

- (void)registerClassesForHeaderFooterReuseWithTableView:(UITableView *)tableView {
    if (_reuseInfo) {
        [self.reuseInfo enumerateKeysAndObjectsUsingBlock:^(NSString *key, KMYTableViewHeaderFooterConfiguratorReuseInfo *info, BOOL *stop) {
            [tableView registerClass:info.cls forHeaderFooterViewReuseIdentifier:info.reuseIdentifier];
        }];
    }
}

- (void)configureHeaderView:(UITableViewHeaderFooterView *)headerView
                withSection:(KMYUISection *)section
             atSectionIndex:(NSInteger)sectionIndex {
    NSString * const reuseIdentifier    = [self headerReuseIdentifierForSection:section];
    KMYAssert(reuseIdentifier);
    NSString * const reuseInfoKey       = [self reuseInfoKeyFromIdentifier:reuseIdentifier kind:KMYTableViewKindSectionHeader];
    KMYTableViewHeaderFooterConfiguratorReuseInfo *info = _reuseInfo ? self.reuseInfo[reuseInfoKey] : nil;
    KMYInvokeBlockIfSet(info.handler, headerView, section, sectionIndex);
}

- (void)configureFooterView:(UITableViewHeaderFooterView *)headerView
                withSection:(KMYUISection *)section
             atSectionIndex:(NSInteger)sectionIndex {
    NSString * const reuseIdentifier    = [self footerReuseIdentifierForSection:section];
    KMYAssert(reuseIdentifier);
    NSString * const reuseInfoKey       = [self reuseInfoKeyFromIdentifier:reuseIdentifier kind:KMYTableViewKindSectionFooter];
    KMYTableViewHeaderFooterConfiguratorReuseInfo *info = _reuseInfo ? self.reuseInfo[reuseInfoKey] : nil;
    KMYInvokeBlockIfSet(info.handler, headerView, section, sectionIndex);
}

#pragma mark - Private -

- (NSString *)reuseInfoKeyFromIdentifier:(NSString *)reuseIdentifier kind:(NSString *)kind {
    return [reuseIdentifier stringByAppendingString:kind];
}

- (NSMutableDictionary *)reuseInfo {
    if (!_reuseInfo) _reuseInfo = [[NSMutableDictionary alloc] init];
    return _reuseInfo;
}

@end





















