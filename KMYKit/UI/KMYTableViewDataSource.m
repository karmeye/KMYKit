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

- (instancetype)initWithSectionProvider:(id<KMYSectionProvider>)sectionProvider cellConfigurator:(id<KMYTableViewCellConfigurator>)cellConfigurator {
    self = [self initWithSectionProvider:sectionProvider];
    if (self) {
        self.cellConfigurator = cellConfigurator;
    }
    return self;
}

- (instancetype)initWithCellConfigurator:(nullable id<KMYTableViewCellConfigurator>)cellConfigurator {
    self = [self init];
    if (self) {
        self.cellConfigurator = cellConfigurator;
    }
    return self;
}

#pragma mark - Public -

- (id<KMYTableViewCellConfigurator>)cellConfigurator {
    if (!_cellConfigurator) _cellConfigurator = [[KMYTableViewCellConfigurator alloc] init];
    return _cellConfigurator;
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionProvider.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sectionProvider.sections[section].numberOfItems;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KMYUIItem *item = self.sectionProvider.sections[indexPath.section].items[indexPath.row];
    KMYAssert(item.reuseIdentifier, @"Missing reuse identifier for item: %@", item);

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.reuseIdentifier];
    KMYAssert(cell, @"No cell was registered with reuse identifier: %@", item.reuseIdentifier);

    [self.cellConfigurator configureCell:cell withItem:item atIndexPath:indexPath];
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.sectionProvider.sections[section] valueForAttribute:KMYUISectionKeyHeaderTitle];
}

- (NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self.sectionProvider.sections[section] valueForAttribute:KMYUISectionKeyFooterTitle];
}

@end











































