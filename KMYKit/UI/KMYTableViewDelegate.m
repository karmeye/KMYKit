//
//  KMYTableViewDelegate.m
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewDelegate.h"
#import "KMYUIItem+TableView.h"

@interface KMYTableViewDelegate ()
@end

@implementation KMYTableViewDelegate

- (instancetype)initWithSectionProvider:(id<KMYSectionProvider>)sectionProvider {
    self = [self init];
    if (self) {
        self.sectionProvider = sectionProvider;
    }
    return self;
}

#pragma mark - UITableViewDelegate

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex {

    UITableViewHeaderFooterView *view;

    KMYUISection *section       = self.sectionProvider.sections[sectionIndex];
    NSString *reuseIdentifier   = [self.headerFooterConfigurator headerReuseIdentifierForSection:section];

    if (reuseIdentifier) {
        view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
        if (view) [self.headerFooterConfigurator configureHeaderView:view withSection:section atSectionIndex:sectionIndex];
    }

    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)sectionIndex {

    UITableViewHeaderFooterView *view;

    KMYUISection *section       = self.sectionProvider.sections[sectionIndex];
    NSString *reuseIdentifier   = [self.headerFooterConfigurator footerReuseIdentifierForSection:section];

    if (reuseIdentifier) {
        view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
        if (view) [self.headerFooterConfigurator configureFooterView:view withSection:section atSectionIndex:sectionIndex];
    }
    
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KMYUIItem *item = self.sectionProvider.sections[indexPath.section].items[indexPath.row];
    KMYInvokeBlockIfSet(item.actionHandler, item, @{ KMYUIItemActionHandlerInfoKeyIndexPath : indexPath });

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end



















