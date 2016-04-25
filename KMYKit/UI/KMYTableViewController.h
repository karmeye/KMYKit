//
//  KMYTableViewController.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <KMYKit/KMYViewController.h>
#import <KMYKit/KMYTableViewControllerBehavior.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYTableViewController : KMYViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonnull, strong, readonly)       KMYTableViewControllerBehavior     *tableViewBehavior;

- (instancetype)initWithStyle:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END