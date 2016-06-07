//
//  UISwitch+KMY.m
//  KMYKit
//
//  Created on 03/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UISwitch+KMY.h"
#import <objc/runtime.h>
#import "KMY+Foundation.h"

static const void   *KMYUISwitchKeyValueDidChangeHandler = &KMYUISwitchKeyValueDidChangeHandler;

@implementation UISwitch (KMY)

- (void)setKmy_valueDidChangeHandler:(void (^)(__kindof UISwitch *))handler {

    [self removeTarget:self action:@selector(kmy_valueDidChange:) forControlEvents:UIControlEventValueChanged];

    if (handler != NULL) {
        [self addTarget:self action:@selector(kmy_valueDidChange:) forControlEvents:UIControlEventValueChanged];
        objc_setAssociatedObject(self, KMYUISwitchKeyValueDidChangeHandler, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void (^)(__kindof UISwitch *))kmy_valueDidChangeHandler {
    return objc_getAssociatedObject(self, KMYUISwitchKeyValueDidChangeHandler);
}

#pragma mark - Private -

- (void)kmy_valueDidChange:(UISwitch *)switchControl {
    KMYInvokeBlockIfSet(self.kmy_valueDidChangeHandler, switchControl);
}

@end
