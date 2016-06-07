//
//  UIGestureRecognizer+KMY.m
//  KMYKit
//
//  Created on 01/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIGestureRecognizer+KMY.h"
#import <objc/runtime.h>
#import <KMYKit/KMY+Foundation.h>

static const void   *KMYGestureRecognizerKeyHandler         = &KMYGestureRecognizerKeyHandler;
#define             KMYGestureRecognizerActionSelector()    @selector(kmy_gestureRecognizerAction:)

@implementation UIGestureRecognizer (KMY)

+ (instancetype)kmy_gestureRecognizerWithHandler:(void (^)(__kindof UIGestureRecognizer *gestureRecognizer))handler {
    return [[self class] kmy_gestureRecognizerWithInitializer:NULL handler:handler];
}

+ (instancetype)kmy_gestureRecognizerWithInitializer:(void (^_Nullable)(__kindof UIGestureRecognizer *gestureRecognizer))initializer
                                             handler:(void (^_Nullable)(__kindof UIGestureRecognizer *gestureRecognizer))handler {
    UIGestureRecognizer *gestureRecognizer = [[[self class] alloc] kmy_initWithHandler:handler];
    if (gestureRecognizer && initializer != NULL) initializer(gestureRecognizer);
    return gestureRecognizer;
}

- (instancetype)kmy_initWithHandler:(void (^)(__kindof UIGestureRecognizer *gestureRecognizer))handler {
    UIGestureRecognizer *gestureRecognizer = [self initWithTarget:self action:KMYGestureRecognizerActionSelector()];
    [gestureRecognizer kmy_registerActionHandler:handler];
    return gestureRecognizer;
}

#pragma mark - Private -

- (void)kmy_registerActionHandler:(void (^)(__kindof UIGestureRecognizer *buttonItem))handler {
    if (handler != NULL) objc_setAssociatedObject(self, KMYGestureRecognizerKeyHandler, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)kmy_gestureRecognizerAction:(__kindof UIGestureRecognizer *)sender {
    void (^handler)(__kindof UIGestureRecognizer *) = objc_getAssociatedObject(self, KMYGestureRecognizerKeyHandler);
    KMYInvokeBlockIfSet(handler, self);
}

@end
