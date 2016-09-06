//
//  KMYGate.m
//  KMYKit
//
//  Created on 31/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYGate.h"
#import "KMYDispatch.h"

@interface KMYGate ()

@property (nonatomic, copy)     void                        (^didOpenHandler)();
@property (nonatomic, copy)     void                        (^didCloseHandler)();
@property (nonatomic, strong)   dispatch_queue_t            callbackQueue;
@property (nonatomic, assign)   NSInteger                   openRequestCount;

@end

@implementation KMYGate

+ (instancetype)gateWithOpenHandler:(void (^)())didOpenHandler closeHandler:(void (^)())didCloseHandler {
    return [[self class] gateWithOpenHandler:didOpenHandler closeHandler:didCloseHandler callbackQueue:nil];
}

+ (instancetype)gateWithOpenHandler:(void (^)())didOpenHandler closeHandler:(void (^)())didCloseHandler callbackQueue:(dispatch_queue_t)callbackQueue {
    KMYGate *s          = [[[self class] alloc] init];
    s.callbackQueue     = callbackQueue;
    s.didOpenHandler    = didOpenHandler;
    s.didCloseHandler   = didCloseHandler;
    return s;
}

- (void)enter {
    BOOL didOpen = NO;

    @synchronized(self) {
        BOOL wasClosed = self.openRequestCount == 0;
        self.openRequestCount += 1;
        didOpen = wasClosed && self.openRequestCount > 0;
    }

    if (didOpen && self.didOpenHandler != NULL) {
        if (self.callbackQueue) {
            dispatch_async(self.callbackQueue, self.didOpenHandler);
        } else {
            self.didOpenHandler();
        }
    }
}

- (void)exit {
    BOOL didClose = NO;

    @synchronized(self) {
        BOOL wasOpen = self.openRequestCount > 0;
        self.openRequestCount = MAX(self.openRequestCount - 1, 0);
        didClose = wasOpen && self.openRequestCount == 0;
    }

    if (didClose && self.didCloseHandler != NULL) {
        if (self.callbackQueue) {
            dispatch_async(self.callbackQueue, self.didCloseHandler);
        } else {
            self.didCloseHandler();
        }
    }
}

@end



































