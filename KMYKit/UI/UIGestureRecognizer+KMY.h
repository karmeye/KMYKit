//
//  UIGestureRecognizer+KMY.h
//  KMYKit
//
//  Created on 01/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (KMY)

+ (instancetype)kmy_gestureRecognizerWithInitializer:(void (^_Nullable)(__kindof UIGestureRecognizer *gestureRecognizer))initializer handler:(void (^_Nullable)(__kindof UIGestureRecognizer *gestureRecognizer))handler;
+ (instancetype)kmy_gestureRecognizerWithHandler:(void (^_Nullable)(__kindof UIGestureRecognizer *gestureRecognizer))handler;

- (instancetype)kmy_initWithHandler:(void (^_Nullable)(__kindof UIGestureRecognizer *gestureRecognizer))handler;

@end

NS_ASSUME_NONNULL_END