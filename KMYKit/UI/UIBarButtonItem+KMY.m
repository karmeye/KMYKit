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

+ (instancetype)kmy_buttonWithTitle:(NSString *)title
                            handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    return [[[self class] alloc] kmy_initWithTitle:title style:UIBarButtonItemStylePlain handler:handler];
}

+ (instancetype)kmy_buttonWithTitle:(NSString *)title
                        initializer:(void (^)(__kindof UIBarButtonItem *buttonItem))initializer
                            handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *buttonItem = [[[self class] alloc] kmy_initWithTitle:title style:UIBarButtonItemStylePlain handler:handler];
    KMYInvokeBlockIfSet(initializer, buttonItem);
    return buttonItem;
}

+ (instancetype)kmy_doneButtonWithTitle:(NSString *)title
                                handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    return [[[self class] alloc] kmy_initWithTitle:title style:UIBarButtonItemStyleDone handler:handler];
}

+ (instancetype)kmy_doneButtonWithTitle:(NSString *)title
                            initializer:(void (^)(__kindof UIBarButtonItem *buttonItem))initializer
                                handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *buttonItem = [[[self class] alloc] kmy_initWithTitle:title style:UIBarButtonItemStyleDone handler:handler];
    KMYInvokeBlockIfSet(initializer, buttonItem);
    return buttonItem;
}

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem {
    return [[self class] kmy_buttonWithSystemItem:systemItem initializer:NULL handler:NULL];
}

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem
                                 handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    return [[self class] kmy_buttonWithSystemItem:systemItem initializer:NULL handler:handler];
}

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem
                             initializer:(void (^_Nullable)(__kindof UIBarButtonItem *buttonItem))initializer {
    return [[self class] kmy_buttonWithSystemItem:systemItem initializer:initializer handler:NULL];
}

+ (instancetype)kmy_buttonWithSystemItem:(UIBarButtonSystemItem)systemItem
                             initializer:(void (^)(__kindof UIBarButtonItem *buttonItem))initializer
                                 handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *buttonItem = [[[self class] alloc] kmy_initWithBarButtonSystemItem:systemItem handler:handler];
    KMYInvokeBlockIfSet(initializer, buttonItem);
    return buttonItem;
}

+ (instancetype)kmy_buttonWithImage:(UIImage *)image
                            handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    return [[[self class] alloc] kmy_initWithImage:image handler:handler];
}

+ (instancetype)kmy_buttonWithImage:(UIImage *)image
                        initializer:(void (^)(__kindof UIBarButtonItem *buttonItem))initializer
                            handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *buttonItem = [[[self class] alloc] kmy_initWithImage:image handler:handler];
    KMYInvokeBlockIfSet(initializer, buttonItem);
    return buttonItem;
}

+ (instancetype)kmy_buttonWithCustomView:(UIView *)view {
    return [[[self class] alloc] kmy_initWithCustomView:view];
}

+ (instancetype)kmy_buttonWithFlexibleSpace {
    return [[[self class] alloc] kmy_initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace handler:NULL];
}

+ (instancetype)kmy_buttonWithFixedSpace:(CGFloat)space {
    UIBarButtonItem *item = [[[self class] alloc] kmy_initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace handler:NULL];
    item.width = space;
    return item;
}

- (instancetype)kmy_initWithTitle:(NSString *)title
                            style:(UIBarButtonItemStyle)style
                          handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *barButtonItem = [self initWithTitle:title style:style target:self action:KMYBarButtonItemActionSelector()];
    [barButtonItem kmy_registerHandler:handler];
    return barButtonItem;
}

- (instancetype)kmy_initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem
                                        handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *barButtonItem = [self initWithBarButtonSystemItem:systemItem target:self action:KMYBarButtonItemActionSelector()];
    [barButtonItem kmy_registerHandler:handler];
    return barButtonItem;
}

- (instancetype)kmy_initWithImage:(UIImage *)image
                          handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *barButtonItem = [self initWithImage:image style:UIBarButtonItemStylePlain target:self action:KMYBarButtonItemActionSelector()];
    [barButtonItem kmy_registerHandler:handler];
    return barButtonItem;
}

- (instancetype)kmy_initWithCustomView:(UIView *)view {
    UIBarButtonItem *barButtonItem = [self initWithCustomView:view];
    return barButtonItem;
}

- (void)setKmy_actionHandler:(void (^)(__kindof UIBarButtonItem *))actionHandler {
    [self kmy_registerHandler:actionHandler];
}

- (void (^)(__kindof UIBarButtonItem *))kmy_actionHandler {
    return objc_getAssociatedObject(self, KMYBarButtonItemKeyHandler);
}

#pragma mark - Private -

- (void)kmy_registerHandler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    if (handler != NULL) objc_setAssociatedObject(self, KMYBarButtonItemKeyHandler, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)kmy_barButtonItemAction:(UIBarButtonItem *)sender {
    void (^handler)(__kindof UIBarButtonItem *) = self.kmy_actionHandler;
    KMYInvokeBlockIfSet(handler, self);
}

@end





























