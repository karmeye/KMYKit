//
//  KMYTableViewController.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewController.h"
#import "UITableViewController+KMY.h"

@interface KMYTableViewControllerBehavior ()

@property (nonatomic, assign)           UITableViewStyle                    tableViewStyle;
@property (nonatomic, strong)           UITableViewController               *tableViewController;

@end

@implementation KMYTableViewControllerBehavior

- (nullable instancetype)initWithStyle:(UITableViewStyle)style {
    self = [self init];
    if (self) {
        self.tableViewStyle = style;
    }
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

    UITableView *tableView      = self.tableViewController.tableView;
    tableView.frame             = parentViewController.view.bounds;
    tableView.autoresizingMask  = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate          = self.delegate;
    tableView.dataSource        = self.dataSource;

    [parentViewController.view addSubview:tableView];
}

- (void)parentViewControllerDidLoadView:(UIViewController *)parentViewController {
    KMYInvokeBlockIfSet(self.tableViewDidLoad, self.tableViewController.tableView);
}

@end

#pragma mark -

@interface KMYTableViewController ()
@end

@implementation KMYTableViewController

@dynamic tableViewBehavior;

- (instancetype)init {
    return [self initWithStyle:UITableViewStylePlain];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithBehavior:[[KMYTableViewControllerBehavior alloc] initWithStyle:style]];

    if (self) {
        KMY_WEAK(self, weakSelf);
        self.tableViewBehavior.tableViewDidLoad = ^(UITableView *tableView) {
            KMY_STRONG(weakSelf, strongSelf);
            strongSelf.tableView.delegate = strongSelf;
            strongSelf.tableView.dataSource = strongSelf;
        };
    }

    return self;
}

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UITableView*)tableView {
    return self.tableViewBehavior.tableView;
}

- (void)reloadData {
    [self.tableViewBehavior reloadData];
}

- (KMYTableViewControllerBehavior *)tableViewBehavior {
    return self.behavior;
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











































