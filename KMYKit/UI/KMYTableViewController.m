//
//  KMYTableViewController.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewController.h"

@implementation KMYTableViewController

- (instancetype)init {
    return [self initWithStyle:UITableViewStylePlain];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    KMYTableViewControllerBehavior *behavior = [[KMYTableViewControllerBehavior alloc] initWithStyle:style];
    self = [super initWithBehavior:behavior];
    if (self) {
        _tableViewBehavior = behavior;

        KMY_WEAK(self, weakSelf);
        self.tableViewBehavior.tableViewDidLoad = ^(UITableView *tableView) {
            KMY_STRONG(weakSelf, strongSelf);
            strongSelf.tableView.delegate = strongSelf;
            strongSelf.tableView.dataSource = strongSelf;
        };
    }
    return self;
}

- (UITableView*)tableView {
    return self.tableViewBehavior.tableView;
}

- (void)reloadData {
    [self.tableViewBehavior reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    KMYAssert(NO, @"This method must be overridden by subclasses, or set the data source.");
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KMYAssert(NO, @"This method must be overridden by subclasses, or set the data source.");
    return nil;
}

@end











































