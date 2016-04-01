//
//  KMYTableViewController.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewController.h"

@interface KMYTableViewController ()

@property (nonatomic, strong)   UITableViewController   *innerTableViewController;

@end

@implementation KMYTableViewController

- (instancetype)init {
    return [self initWithStyle:UITableViewStylePlain];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super init];

    if (self) {
        self.innerTableViewController = [[UITableViewController alloc] initWithStyle:style];
        [self addChildViewController:self.innerTableViewController];
        [self.innerTableViewController didMoveToParentViewController:self];
    }

    return self;
}

- (void)loadView {
    [super loadView];

    self.tableView.frame = self.view.bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UITableView*)tableView {
    return self.innerTableViewController.tableView;
}

- (void)reloadData {
    if ([self isViewLoaded]) {
        [self.tableView reloadData];
    }
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











































