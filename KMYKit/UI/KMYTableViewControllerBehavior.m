//
//  KMYTableViewControllerBehavior.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewControllerBehavior.h"
#import "UITableViewController+KMY.h"
#import "NSLayoutConstraint+KMY.h"

@interface KMYTableViewControllerBehavior ()

@property (nonatomic, assign)           UITableViewStyle                    tableViewStyle;
@property (nonatomic, strong)           UITableViewController               *tableViewController;

@end

@implementation KMYTableViewControllerBehavior

@dynamic tableView, isTableViewLoaded;

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self                            = [self init];
    self.tableViewStyle             = style;
    self.automaticallyAddsTableView = YES;

    return self;
}

- (UITableView*)tableView {
    KMYAssert(self.tableViewController);
    return self.tableViewController.tableView;
}

- (BOOL)isTableViewLoaded {
    KMYAssert(self.tableViewController);
    return [self.tableViewController isViewLoaded];
}

- (void)reloadData {
    if (self.isTableViewLoaded) {
        [self.tableView reloadData];
    }
}

#pragma mark - KMYViewControllerBehaving protocol

- (void)initializeWithParentController:(UIViewController *)parentViewController {
    self.tableViewController = [UITableViewController kmy_tableViewControllerWithStyle:self.tableViewStyle initializer:^(UITableViewController *tableViewController) {
        [parentViewController addChildViewController:tableViewController];
        [tableViewController didMoveToParentViewController:parentViewController];
    }];
}

- (void)loadViewWithParentViewController:(UIViewController *)parentViewController {
    if (self.automaticallyAddsTableView) {
        UIView *parentView = parentViewController.view;

        [parentView addSubview:self.tableView];
        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint kmy_constraintsForView:self.tableView equalToEdgesOfView:parentView]];

        self.tableView.delegate     = self.delegate;
        self.tableView.dataSource   = self.dataSource;
    }
}

- (void)parentViewControllerDidLoadView:(UIViewController *)parentViewController {
    KMYInvokeBlockIfSet(self.tableViewDidLoad, self.tableView);
}

@end






























