//
//  KMYApplicationBackgroundTask.h
//  KMYKit
//
//  Created on 2016-11-24.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYApplicationBackgroundTask : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithExecutionHandler:(void(^)(KMYApplicationBackgroundTask *task))executionHandler
                       expirationHandler:(void(^)(void))expirationHandler;

+ (instancetype)beginBackgroundTaskWithExecutionHandler:(void(^)(KMYApplicationBackgroundTask *task))executionHandler
                                      expirationHandler:(void(^)(void))expirationHandler;

- (void)beginBackgroundTask;
- (void)endBackgroundTask;

@end

NS_ASSUME_NONNULL_END
