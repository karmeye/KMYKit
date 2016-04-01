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

@property (nonatomic, strong, readwrite, nullable)      NSArray<KMYUISection *>                 *sections;
@property (nonatomic, strong, readwrite, nullable)      id<KMYTableViewCellConfigurator>        cellConfigurator;

- (instancetype)initWithSections:(nullable NSArray<KMYUISection *> *)sections;
- (instancetype)initWithSections:(nullable NSArray<KMYUISection *> *)sections cellConfigurator:(nullable id<KMYTableViewCellConfigurator>)cellConfigurator;
- (instancetype)initWithCellConfigurator:(nullable id<KMYTableViewCellConfigurator>)cellConfigurator;

@end

NS_ASSUME_NONNULL_END