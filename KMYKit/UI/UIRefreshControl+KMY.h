//
//  UIRefreshControl+KMY.h
//  KMYKit
//
//  Created on 2016-10-04.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIRefreshControl (KMY)

+ (instancetype)kmy_refreshControlWithInitializer:(void (^_Nullable)(__kindof UIRefreshControl *refreshControl))initializer handler:(void (^_Nullable)(__kindof UIRefreshControl *refreshControl))handler;
+ (instancetype)kmy_refreshControlWithHandler:(void (^_Nullable)(__kindof UIRefreshControl *refreshControl))handler;

@end

NS_ASSUME_NONNULL_END
