//
//  NSNotificationCenter+KMY.m
//  KMYKit
//
//  Created on 2017-03-08.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import "NSNotificationCenter+KMY.h"
#import "KMYDispatch.h"

@implementation NSNotificationCenter (KMY)

- (void)kmy_postNotificationOnMainQueueAsync:(BOOL)async withName:(NSString *)notificationName object:(id)object userInfo:(NSDictionary *)userInfo {
    dispatch_block_t block = ^{
        [self postNotificationName:notificationName object:object userInfo:userInfo];
    };

    if (async) {
        kmy_dispatch_async_on_main_queue(block);
    } else {
        kmy_dispatch_sync_on_main_queue(block);
    }
}


@end
