//
//  KMYTableViewController.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMYTableViewControllerBehavior : NSObject<KMYViewControllerBehaving>

@property (nonatomic, strong, readonly) UITableView                         *tableView;
@property (nonatomic, weak, nullable)   id <UITableViewDataSource>          dataSource;
@property (nonatomic, weak, nullable)   id <UITableViewDelegate>            delegate;

/// Set dataSource, delegate and register reusable cells here.
@property (nonatomic, copy, nullable)   void (^tableViewDidLoad)(UITableView *);

- (nullable instancetype)initWithStyle:(UITableViewStyle)style;
- (void)reloadData;

@end

@interface KMYTableViewController : KMYViewController <UITableViewDataSource, UITableViewDelegate>

/// Convenience cast
@property (nonnull, strong, readonly)       KMYTableViewControllerBehavior     *tableViewBehavior;

- (instancetype)initWithStyle:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END