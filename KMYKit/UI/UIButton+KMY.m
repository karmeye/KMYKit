//
//  UIButton+KMY.m
//  KMYKit
//
//  Created on 14/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIButton+KMY.h"
#import <objc/runtime.h>
#import "KMY+Foundation.h"

static const void   *KMYUIButtonKeyTouchUpInsideHandler = &KMYUIButtonKeyTouchUpInsideHandler;

@implementation UIButton (KMY)

+ (nullable instancetype)kmy_buttonWithType:(UIButtonType)buttonType
                                initializer:(void (^_Nullable)(__kindof UIButton *button))initializer {
    return [[self class] kmy_buttonWithType:buttonType initializer:initializer handler:NULL];
}

+ (nullable instancetype)kmy_buttonWithType:(UIButtonType)buttonType
                                initializer:(void (^_Nullable)(__kindof UIButton *button))initializer
                                    handler:(void (^_Nullable)(__kindof UIButton *button))handler {
    UIButton *button = [[self class] buttonWithType:buttonType];
    button.kmy_touchUpInsideHandler = handler;
    if (initializer != NULL) initializer(button);
    return button;
}

- (void)setKmy_touchUpInsideHandler:(void (^)(__kindof UIButton *))handler {
    [self removeTarget:self action:@selector(kmy_touchUpInside:) forControlEvents:UIControlEventTouchUpInside];

    if (handler != NULL) {
        [self addTarget:self action:@selector(kmy_touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        objc_setAssociatedObject(self, KMYUIButtonKeyTouchUpInsideHandler, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void (^)(__kindof UIButton *))kmy_touchUpInsideHandler {
    return objc_getAssociatedObject(self, KMYUIButtonKeyTouchUpInsideHandler);
}

#pragma mark - Private -

- (void)kmy_touchUpInside:(UIButton *)button {
    KMYInvokeBlockIfSet(self.kmy_touchUpInsideHandler, button);
}

@end
