//
//  KMYApplicationBackgroundTask.m
//  KMYKit
//
//  Created on 2016-11-24.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYApplicationBackgroundTask.h"
#import "KMY+Foundation.h"

@interface KMYApplicationBackgroundTask ()

@property (nonatomic, assign)           UIBackgroundTaskIdentifier      taskIdentifier;
@property (nonatomic, weak)             UIApplication                   *application;

@property (nonatomic, copy, nonnull)    void                            (^executionHandler)(KMYApplicationBackgroundTask *task);
@property (nonatomic, copy, nonnull)    void                            (^expirationHandler)();

@end

@implementation KMYApplicationBackgroundTask

- (void)dealloc {
    NSLog(@"KMYApplicationBackgroundTask dealloc");
}

- (instancetype)initWithExecutionHandler:(void(^)(KMYApplicationBackgroundTask *task))executionHandler
                       expirationHandler:(void(^)(void))expirationHandler {

    self                    = [super init];
    self.application        = UIApplication.sharedApplication;
    self.executionHandler   = executionHandler;
    self.expirationHandler  = expirationHandler;

    return self;
}

+ (instancetype)beginBackgroundTaskWithExecutionHandler:(void(^)(KMYApplicationBackgroundTask *task))executionHandler
                                      expirationHandler:(void(^)(void))expirationHandler {
    KMYApplicationBackgroundTask *task = [[[self class] alloc] initWithExecutionHandler:executionHandler expirationHandler:expirationHandler];
    [task beginBackgroundTask];
    return task;
}

- (void)beginBackgroundTask {

    if (self.taskIdentifier != UIBackgroundTaskInvalid) {
        return;
    }

    // Doc: This method can be safely called on a non-main thread.
    self.taskIdentifier = [self.application
                           beginBackgroundTaskWithName:nil
                           expirationHandler:^{
                               KMYInvokeBlockIfSet(self.expirationHandler);
                               [self endBackgroundTask];
                           }];

    if (self.taskIdentifier != UIBackgroundTaskInvalid) {
        self.executionHandler(self);
    }
}

- (void)endBackgroundTask {

    if (self.taskIdentifier != UIBackgroundTaskInvalid) {

        // Doc: This method can be safely called on a non-main thread.
        [self.application endBackgroundTask:self.taskIdentifier];

        self.taskIdentifier = UIBackgroundTaskInvalid;
        NSLog(@"KMYApplicationBackgroundTask Task Ended");
    }
}

@end

































