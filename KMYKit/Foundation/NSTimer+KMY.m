//
//  NSTimer+KMY.m
//  KMYKit
//
//  Created on 25/07/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSTimer+KMY.h"
#import "KMYBlock.h"

@interface KMYNSTimerTarget : NSObject

@property (nonatomic, copy)     void    (^handler)(NSTimer *timer);

- (instancetype)initWithHandler:(void (^)(NSTimer *timer))handler;

@end

@implementation KMYNSTimerTarget

- (instancetype)initWithHandler:(void (^)(NSTimer *timer))handler {
    self = [super init];
    self.handler = handler;
    return self;
}

- (void)timerWithTimeIntervalTrigger:(NSTimer *)timer {
    KMYInvokeBlockIfSet(self.handler, timer);
}

@end

@implementation NSTimer (KMY)

+ (NSTimer *)kmy_timerWithTimeInterval:(NSTimeInterval)interval userInfo:(id)userInfo repeats:(BOOL)repeats handler:(void (^)(NSTimer *timer))handler {

    // The timer maintains a strong reference to the target object until it (the timer) is invalidated.
    NSTimer *timer = [NSTimer timerWithTimeInterval:interval target:[[KMYNSTimerTarget alloc] initWithHandler:handler] selector:@selector(timerWithTimeIntervalTrigger:) userInfo:userInfo repeats:repeats];

    if ([NSThread isMainThread]) {
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{ [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes]; });
    }

    return timer;
}

@end











































