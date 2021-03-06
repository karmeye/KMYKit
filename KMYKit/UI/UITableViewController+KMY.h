//
//  UITableViewController+KMY.h
//  KMYKit
//
//  Created on 05/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewController (KMY)

+ (nullable instancetype)kmy_tableViewControllerWithStyle:(UITableViewStyle)style initializer:(void (^_Nullable)(__kindof UITableViewController *viewController))initializer NS_SWIFT_NAME(init(style:initializer:));

@end

NS_ASSUME_NONNULL_END
