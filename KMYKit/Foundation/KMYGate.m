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

@property (nonatomic, strong)   dispatch_queue_t            dispatchQueue;
@property (nonatomic, assign)   NSInteger                   openRequestCount;
@property (nonatomic, strong)   dispatch_queue_t            callbackQueue;

@property (nonatomic, copy)     void                        (^didOpenHandler)(void);
@property (nonatomic, copy)     void                        (^didCloseHandler)(void);

@end

@implementation KMYGate

@dynamic isOpen;

+ (instancetype)gateWithOpenHandler:(void (^)(void))didOpenHandler {
    return [[self class] gateWithOpenHandler:didOpenHandler closeHandler:NULL callbackQueue:nil];
}

+ (instancetype)gateWithCloseHandler:(void (^)(void))didCloseHandler {
    return [[self class] gateWithOpenHandler:NULL closeHandler:didCloseHandler callbackQueue:nil];
}

+ (instancetype)gateWithOpenHandler:(void (^)(void))didOpenHandler closeHandler:(void (^)(void))didCloseHandler {
    return [[self class] gateWithOpenHandler:didOpenHandler closeHandler:didCloseHandler callbackQueue:nil];
}

+ (instancetype)gateWithOpenHandler:(void (^)(void))didOpenHandler closeHandler:(void (^)(void))didCloseHandler callbackQueue:(dispatch_queue_t)callbackQueue {
    KMYGate *s          = [[[self class] alloc] init];
    s.callbackQueue     = callbackQueue;
    s.dispatchQueue     = dispatch_queue_create("com.KMYKit.KMYGate", dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_DEFAULT, -1));
    s.didOpenHandler    = didOpenHandler;
    s.didCloseHandler   = didCloseHandler;
    return s;
}

- (void)enter {
    BOOL __block didOpen;

    dispatch_sync(self.dispatchQueue, ^{
        BOOL wasClosed              = self.openRequestCount == 0;
        self.openRequestCount       += 1;
        didOpen                     = wasClosed && self.openRequestCount > 0;
    });

    if (didOpen && self.didOpenHandler != NULL) {
        if (self.callbackQueue) {
            dispatch_async(self.callbackQueue, self.didOpenHandler);
        } else {
            self.didOpenHandler();
        }
    }
}

- (void)exit {
    BOOL __block didClose;

    dispatch_sync(self.dispatchQueue, ^{
        BOOL const wasOpen      = self.openRequestCount > 0;
        self.openRequestCount   = MAX(self.openRequestCount - 1, 0);
        didClose                = wasOpen && self.openRequestCount == 0;
    });

    if (didClose && self.didCloseHandler != NULL) {
        if (self.callbackQueue) {
            dispatch_async(self.callbackQueue, self.didCloseHandler);
        } else {
            self.didCloseHandler();
        }
    }
}

- (BOOL)isOpen {
    BOOL __block isOpen;

    dispatch_sync(self.dispatchQueue, ^{
        isOpen = self.openRequestCount > 0;
    });
    
    return isOpen;
}

- (void)forceClose {
    if (self.isOpen) {

        dispatch_sync(self.dispatchQueue, ^{
            self.openRequestCount = 1;
        });

        [self exit];
    }
}

@end



































