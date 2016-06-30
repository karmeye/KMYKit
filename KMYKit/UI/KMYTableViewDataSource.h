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
@property (nonatomic, strong, readwrite)                id<KMYTableViewCellConfigurating>   cellConfigurator;

@property (nonatomic, assign, readwrite)                BOOL                                canEditAllRows;

/// Attribute used to lookup return value in @c tableView:titleForHeaderInSection:.
/// Set to @c nil to return @c nil.
/// Defaults to @c KMYUISectionKeyHeaderTitle.
@property (nonatomic, copy, nullable)                   NSString                            *attributeForHeaderTitle;

/// Attribute used to lookup return value in @c tableView:titleForFooterInSection:.
/// Set to @c nil to return @c nil.
/// Defaults to @c KMYUISectionKeyFooterTitle.
@property (nonatomic, copy, nullable)                   NSString                            *attributeForFooterTitle;

@property (nonatomic, copy, nullable) void (^commitEditingHandler)(UITableView *tableView, __kindof KMYUIItem *item, NSIndexPath *indexPath, UITableViewCellEditingStyle editingStyle);

- (instancetype)initWithSectionProvider:(nullable id<KMYSectionProvider>)sectionProvider;
- (instancetype)initWithSectionProvider:(nullable id<KMYSectionProvider>)sectionProvider cellConfigurator:(nullable id<KMYTableViewCellConfigurating>)cellConfigurator;
- (instancetype)initWithCellConfigurator:(nullable id<KMYTableViewCellConfigurating>)cellConfigurator;

@end

NS_ASSUME_NONNULL_END