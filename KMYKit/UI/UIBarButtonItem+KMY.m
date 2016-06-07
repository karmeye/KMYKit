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

+ (instancetype)kmy_buttonWithImage:(UIImage *)image handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    return [[[self class] alloc] kmy_initWithImage:image handler:handler];
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

- (instancetype)kmy_initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *barButtonItem = [self initWithTitle:title style:style target:handler == NULL ? nil : self action:handler == NULL ? nil : KMYBarButtonItemActionSelector()];
    [barButtonItem kmy_registerHandler:handler];
    return barButtonItem;
}

- (instancetype)kmy_initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *barButtonItem = [self initWithBarButtonSystemItem:systemItem target:handler == NULL ? nil : self action:handler == NULL ? nil : KMYBarButtonItemActionSelector()];
    [barButtonItem kmy_registerHandler:handler];
    return barButtonItem;
}

- (instancetype)kmy_initWithImage:(UIImage *)image handler:(void (^)(__kindof UIBarButtonItem *buttonItem))handler {
    UIBarButtonItem *barButtonItem = [self initWithImage:image style:UIBarButtonItemStylePlain target:handler == NULL ? nil : self action:handler == NULL ? nil : KMYBarButtonItemActionSelector()];
    [barButtonItem kmy_registerHandler:handler];
    return barButtonItem;
}
- (instancetype)kmy_initWithCustomView:(UIView *)view {
    UIBarButtonItem *barButtonItem = [self initWithCustomView:view];
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





























