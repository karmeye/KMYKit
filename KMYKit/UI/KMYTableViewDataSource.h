//
//  KMYTableViewDataSource.h
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMY+Foundation.h"
#import "KMYUISection.h"
#import "KMYTableViewCellConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMYTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak, readwrite, nullable)        id<KMYSectionProvider>              sectionProvider;
@property (nonatomic, strong, readwrite, nullable)      id<KMYTableViewCellConfigurator>    cellConfigurator;

@property (nonatomic, assign, readwrite)                BOOL                                canEditAllRows;

@property (nonatomic, copy, nullable) void (^commitEditingHandler)(UITableView *tableView, __kindof KMYUIItem *item, NSIndexPath *indexPath, UITableViewCellEditingStyle editingStyle);

- (instancetype)initWithSectionProvider:(nullable id<KMYSectionProvider>)sectionProvider;
- (instancetype)initWithSectionProvider:(nullable id<KMYSectionProvider>)sectionProvider cellConfigurator:(nullable id<KMYTableViewCellConfigurator>)cellConfigurator;
- (instancetype)initWithCellConfigurator:(nullable id<KMYTableViewCellConfigurator>)cellConfigurator;

@end

NS_ASSUME_NONNULL_END