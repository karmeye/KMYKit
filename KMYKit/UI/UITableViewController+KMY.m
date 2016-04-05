//
//  UITableViewController+KMY.m
//  KMYKit
//
//  Created on 05/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UITableViewController+KMY.h"

@implementation UITableViewController (KMY)

+ (instancetype)kmy_initWithStyle:(UITableViewStyle)style initializer:(void (^)(UITableViewController *viewController))initializer {
    id instance = [[[self class] alloc] initWithStyle:style];
    if (instance && initializer != NULL) initializer(instance);
    return instance;
}

@end
