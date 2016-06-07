//
//  KMYTableViewDataSource.m
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewDataSource.h"

@interface KMYTableViewDataSource ()
@end

@implementation KMYTableViewDataSource

- (instancetype)initWithSectionProvider:(id<KMYSectionProvider>)sectionProvider {
    self = [self init];
    if (self) {
        self.sectionProvider = sectionProvider;
    }
    return self;
}

- (instancetype)initWithSectionProvider:(id<KMYSectionProvider>)sectionProvider cellConfigurator:(id<KMYTableViewCellConfigurating>)cellConfigurator {
    self = [self initWithSectionProvider:sectionProvider];
    if (self) {
        self.cellConfigurator = cellConfigurator;
    }
    return self;
}

- (instancetype)initWithCellConfigurator:(nullable id<KMYTableViewCellConfigurating>)cellConfigurator {
    self = [self init];
    if (self) {
        self.cellConfigurator = cellConfigurator;
    }
    return self;
}

#pragma mark - Public -

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionProvider.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sectionProvider.sections[section].numberOfItems;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // Create a default configurator if none is set.
    if (!self.cellConfigurator) {
        self.cellConfigurator = [KMYTableViewCellConfigurator kmy_objectWithInitializer:^(KMYTableViewCellConfigurator *configurator) {
            [configurator registerClassesForCellReuseWithTableView:tableView];
        }];
    }

    KMYUIItem *item = self.sectionProvider.sections[indexPath.section].items[indexPath.row];

    NSString *reuseIdentifier = [self.cellConfigurator reuseIdentifierForItem:item];
    KMYAssert(reuseIdentifier, @"Missing reuse identifier for item: %@", item);

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    KMYAssert(cell, @"No cell was registered with reuse identifier: %@", reuseIdentifier);

    [self.cellConfigurator configureCell:cell withItem:item atIndexPath:indexPath];
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.sectionProvider.sections[section] valueForAttribute:KMYUISectionKeyHeaderTitle];
}

- (NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self.sectionProvider.sections[section] valueForAttribute:KMYUISectionKeyFooterTitle];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.canEditAllRows) {
        return YES;
    } else {
        KMYUIItem *item = self.sectionProvider.sections[indexPath.section].items[indexPath.row];
        return (item.editingOptions & KMYUIItemEditingOptionsDelete) || (item.editingOptions & KMYUIItemEditingOptionsInsert);
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    KMYUIItem *item = self.sectionProvider.sections[indexPath.section].items[indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete && item.editingOptions & KMYUIItemEditingOptionsDelete) {
        KMYInvokeBlockIfSet(self.commitEditingHandler, tableView, item, indexPath, editingStyle);
    } else if (editingStyle == UITableViewCellEditingStyleInsert && item.editingOptions & KMYUIItemEditingOptionsInsert) {
        KMYInvokeBlockIfSet(self.commitEditingHandler, tableView, item, indexPath, editingStyle);
    }
}

@end











































