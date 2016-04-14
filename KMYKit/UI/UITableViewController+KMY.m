//
//  UITableViewController+KMY.m
//  KMYKit
//
//  Created on 05/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UITableViewController+KMY.h"

@implementation UITableViewController (KMY)

+ (instancetype)kmy_tableViewControllerWithStyle:(UITableViewStyle)style initializer:(void (^)(__kindof UITableViewController *viewController))initializer {
    UITableViewController *tableViewController = [[[self class] alloc] initWithStyle:style];
    if (tableViewController && initializer != NULL) initializer(tableViewController);
    return tableViewController;
}

@end
