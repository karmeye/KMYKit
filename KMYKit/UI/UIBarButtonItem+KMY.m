//
//  UIBarButtonItem+KMY.m
//  KMYKit
//
//  Created on 22/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIBarButtonItem+KMY.h"
#import <objc/runtime.h>
#import <KMYKit/KMY+Foundation.h>

static const void   *KMYBarButtonItemKeyHandler         = &KMYBarButtonItemKeyHandler;

#define             KMYBarButtonItemActionSelector()    @selector(kmy_barButtonItemAction:)

@implementation UIBarButtonItem (KMY)

+ (instancetype)kmy_buttonWithTitle:(NSString *)title {
    return [[[self class] alloc] kmy_initWithTitle:title style:UIBarButtonItemStylePlain handler:NULL];
}

+ (instancetype)kmy_buttonWithTitle:(NSString *)title handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    return [[[self class] alloc] kmy_initWithTitle:title style:UIBarButtonItemStylePlain handler:handler];
}

+ (instancetype)kmy_doneButtonWithTitle:(NSString *)title handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    return [[[self class] alloc] kmy_initWithTitle:title style:UIBarButtonItemStyleDone handler:handler];
}

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    return [[[self class] alloc] kmy_initWithBarButtonSystemItem:systemItem handler:handler];
}

- (instancetype)kmy_initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *barButtonItem = [self initWithTitle:title style:style target:self action:KMYBarButtonItemActionSelector()];
    [barButtonItem kmy_registerHandler:handler];
    return barButtonItem;
}

- (instancetype)kmy_initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *barButtonItem = [self initWithBarButtonSystemItem:systemItem target:self action:KMYBarButtonItemActionSelector()];
    [barButtonItem kmy_registerHandler:handler];
    return barButtonItem;
}

#pragma mark - Private -

- (void)kmy_registerHandler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    if (handler != NULL) objc_setAssociatedObject(self, KMYBarButtonItemKeyHandler, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)kmy_barButtonItemAction:(UIBarButtonItem *)sender {
    void (^handler)(__kindof UIBarButtonItem *) = objc_getAssociatedObject(self, KMYBarButtonItemKeyHandler);
    KMYInvokeBlockIfSet(handler, self);
}

@end
