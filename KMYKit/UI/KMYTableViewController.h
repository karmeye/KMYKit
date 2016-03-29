//
//  KMYTableViewController.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMYTableViewController : KMYViewController <UITableViewDataSource, UITableViewDelegate>

/// The table view controlled by the receiver.
@property (nonatomic, strong, readonly) UITableView *tableView;

- (instancetype)initWithStyle:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END