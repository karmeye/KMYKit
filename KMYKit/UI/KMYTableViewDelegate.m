//
//  KMYTableViewDelegate.m
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewDelegate.h"

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KMYUIItem *item = self.sectionProvider.sections[indexPath.section].items[indexPath.row];
    KMYInvokeBlockIfSet(item.actionHandler);

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
