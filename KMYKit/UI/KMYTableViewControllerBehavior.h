//
//  KMYTableViewControllerBehavior.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <KMYKit/KMYViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYTableViewControllerBehavior : NSObject <KMYViewControllerBehaving>

@property (nonatomic, strong, readonly) UITableView                         *tableView;
@property (nonatomic, assign, readonly) BOOL                                isTableViewLoaded;

@property (nonatomic, weak, readonly)   UIViewController                    *behavingViewController;

@property (nonatomic, weak, nullable)   id <UITableViewDataSource>          dataSource;
@property (nonatomic, weak, nullable)   id <UITableViewDelegate>            delegate;

/// Defaults to @YES
@property (nonatomic, assign)           BOOL                                automaticallyAddsTableView;

/// Set dataSource, delegate and register reusable cells here.
@property (nonatomic, copy, nullable)   void (^tableViewDidLoad)(UITableView *);

- (instancetype)initWithStyle:(UITableViewStyle)style;
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
