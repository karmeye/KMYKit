//
//  NSTimer+KMY.h
//  KMYKit
//
//  Created on 25/07/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (KMY)

/// @note The receiver is added to the run loop and retained there; it will not be released until invalidate is called on the receiver. Hence you may store the returned timer in a weak variable and make sure to call invalidate to release it.
+ (NSTimer *)kmy_timerWithTimeInterval:(NSTimeInterval)interval userInfo:(nullable id)userInfo repeats:(BOOL)repeats handler:(void (^)(NSTimer *timer))handler;

@end

NS_ASSUME_NONNULL_END
