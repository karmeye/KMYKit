//
//  KMYGate.h
//  KMYKit
//
//  Created on 31/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYGate : NSObject

@property (nonatomic, assign, readonly)     BOOL    isOpen;

+ (instancetype)gateWithOpenHandler:(void (^)())didOpenHandler closeHandler:(void (^)())didCloseHandler;
+ (instancetype)gateWithOpenHandler:(void (^)())didOpenHandler closeHandler:(void (^)())didCloseHandler callbackQueue:(nullable dispatch_queue_t)callbackQueue;

- (void)enter;
- (void)exit;

@end

NS_ASSUME_NONNULL_END
