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

+ (instancetype)gateWithOpenHandler:(void (^)(void))didOpenHandler;
+ (instancetype)gateWithCloseHandler:(void (^)(void))didCloseHandler;
+ (instancetype)gateWithOpenHandler:(void (^ _Nullable)(void))didOpenHandler closeHandler:(void (^ _Nullable)(void))didCloseHandler;


/**
 Represents a gate into e.g. a house. The gate is closed initially. It opens as the first person enters. As long as there are people in the house, the gate remains open. When the last person leaves the house, the gate is closed.

 @param didOpenHandler Block which will be executed when the gate opens.
 @param didCloseHandler Block which will be executed when the gate closes.
 @param callbackQueue Queue on which the open and close blocks will be executed async. If `nil` the blocks will be executed sync on the same thread the `enter` and `exit` method were called.
 @return A new instance.
 */
+ (instancetype)gateWithOpenHandler:(void (^ _Nullable)(void))didOpenHandler closeHandler:(void (^ _Nullable)(void))didCloseHandler callbackQueue:(nullable dispatch_queue_t)callbackQueue;

- (void)enter;
- (void)exit;

/// Closes the gate, regardless of the number of enters. Appropriate for resetting state when gate is no longer used.
- (void)forceClose;

@end

NS_ASSUME_NONNULL_END
