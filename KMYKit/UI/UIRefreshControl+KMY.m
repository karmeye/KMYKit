//
//  UIRefreshControl+KMY.m
//  KMYKit
//
//  Created on 2016-10-04.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIRefreshControl+KMY.h"
#import <objc/runtime.h>
#import "KMY+Foundation.h"
#import "UIView+KMY.h"

static const void   *KMYUIRefreshControlKeyValueChangedHandler = &KMYUIRefreshControlKeyValueChangedHandler;

@implementation UIRefreshControl (KMY)

+ (instancetype)kmy_refreshControlWithInitializer:(void (^_Nullable)(__kindof UIRefreshControl *refreshControl))initializer handler:(void (^_Nullable)(__kindof UIRefreshControl *refreshControl))handler {
    return [UIRefreshControl kmy_viewWithInitializer:^(UIRefreshControl *refreshControl) {
        KMYInvokeBlockIfSet(initializer, refreshControl);
        [refreshControl setKmy_valueChangedHandler:handler];
    }];
}

+ (instancetype)kmy_refreshControlWithHandler:(void (^_Nullable)(__kindof UIRefreshControl *refreshControl))handler {
    return [UIRefreshControl kmy_viewWithInitializer:^(UIRefreshControl *refreshControl) {
        [refreshControl setKmy_valueChangedHandler:handler];
    }];
}

- (void)setKmy_valueChangedHandler:(void (^)(__kindof UIRefreshControl *))handler {
    [self removeTarget:self action:@selector(kmy_valueChanged:) forControlEvents:UIControlEventValueChanged];

    if (handler != NULL) {
        [self addTarget:self action:@selector(kmy_valueChanged:) forControlEvents:UIControlEventValueChanged];
        objc_setAssociatedObject(self, KMYUIRefreshControlKeyValueChangedHandler, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void (^)(__kindof UIRefreshControl *))kmy_valueChangedHandler {
    return objc_getAssociatedObject(self, KMYUIRefreshControlKeyValueChangedHandler);
}

#pragma mark - Private -

- (void)kmy_valueChanged:(UIRefreshControl *)refreshControl {
    KMYInvokeBlockIfSet(self.kmy_valueChangedHandler, refreshControl);
}

@end
