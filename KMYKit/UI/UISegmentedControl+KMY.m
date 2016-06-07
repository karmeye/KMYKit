//
//  UISegmentedControl+KMY.m
//  KMYKit
//
//  Created on 03/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UISegmentedControl+KMY.h"
#import <objc/runtime.h>
#import "KMY+Foundation.h"

static const void   *KMYUISegmentedControlKeyValueDidChangeHandler = &KMYUISegmentedControlKeyValueDidChangeHandler;

@implementation UISegmentedControl (KMY)

+ (instancetype)kmy_segmentedControlWithWithItems:(NSArray *)items initializer:(void (^)(__kindof UISegmentedControl *segmentedControl))initializer {
    UISegmentedControl *segmentedControl = [[[self class] alloc] initWithItems:items];
    if (segmentedControl && initializer != NULL) initializer(segmentedControl);
    return segmentedControl;
}

- (void)kmy_insertSegmentsWithTitles:(NSArray <NSString *> *)segmentTitles animated:(BOOL)animated {
    NSUInteger segmentIndex = 0;
    for (NSString *title in segmentTitles) {
        [self insertSegmentWithTitle:title atIndex:segmentIndex++ animated:animated];
    }
}

- (void)setKmy_valueDidChangeHandler:(void (^)(__kindof UISegmentedControl *))handler {

    [self removeTarget:self action:@selector(kmy_valueDidChange:) forControlEvents:UIControlEventValueChanged];

    if (handler != NULL) {
        [self addTarget:self action:@selector(kmy_valueDidChange:) forControlEvents:UIControlEventValueChanged];
        objc_setAssociatedObject(self, KMYUISegmentedControlKeyValueDidChangeHandler, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void (^)(__kindof UISegmentedControl *))kmy_valueDidChangeHandler {
    return objc_getAssociatedObject(self, KMYUISegmentedControlKeyValueDidChangeHandler);
}

#pragma mark - Private -

- (void)kmy_valueDidChange:(UISegmentedControl *)segmentedControl {
    KMYInvokeBlockIfSet(self.kmy_valueDidChangeHandler, segmentedControl);
}

@end
