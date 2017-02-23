//
//  KMYTableViewControllerBehavior.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewControllerBehavior.h"
#import "UITableViewController+KMY.h"

@interface KMYTableViewControllerBehavior ()

@property (nonatomic, assign)           UITableViewStyle                    tableViewStyle;
@property (nonatomic, strong)           UITableViewController               *tableViewController;

@end

@implementation KMYTableViewControllerBehavior

@dynamic tableView;

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self                = [self init];
    self.tableViewStyle = style;
    return self;
}

- (UITableView*)tableView {
    return self.tableViewController.tableView;
}

- (void)reloadData {
    if ([self.tableViewController isViewLoaded]) [self.tableView reloadData];
}

- (void)initializeWithParentController:(UIViewController *)parentViewController {
    self.tableViewController = [UITableViewController kmy_tableViewControllerWithStyle:self.tableViewStyle initializer:^(UITableViewController *tableViewController) {
        [parentViewController addChildViewController:tableViewController];
        [tableViewController didMoveToParentViewController:parentViewController];
    }];
}

- (void)loadViewWithParentViewController:(UIViewController *)parentViewController {

    UITableView *tableView      = self.tableView;
    tableView.frame             = parentViewController.view.bounds;
    tableView.autoresizingMask  = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate          = self.delegate;
    tableView.dataSource        = self.dataSource;

    [parentViewController.view addSubview:tableView];
}

- (void)parentViewControllerDidLoadView:(UIViewController *)parentViewController {
    KMYInvokeBlockIfSet(self.tableViewDidLoad, self.tableView);
}

@end
