//
//  NSNotificationCenter+KMY.h
//  KMYKit
//
//  Created on 2017-03-08.
//  Copyright © 2017 Karmeye. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (KMY)

/// May be called from any thread/queue.
- (void)kmy_postNotificationOnMainQueueAsync:(BOOL)async withName:(NSString *)notificationName object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo NS_SWIFT_NAME(kmyPostNotificationOnMainQueue(async:name:object:userInfo:));

@end

NS_ASSUME_NONNULL_END
