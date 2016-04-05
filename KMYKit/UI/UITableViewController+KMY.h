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

+ (nullable instancetype)kmy_initWithStyle:(UITableViewStyle)style initializer:(void (^)(UITableViewController *viewController))initializer;

@end

NS_ASSUME_NONNULL_END