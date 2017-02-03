//
//  KMYSelectableBarButtonItem.m
//  KMYKit
//
//  Created on 2017-02-01.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import "KMYSelectableBarButtonItem.h"
#import "KMY+Foundation.h"
#import "KMYSelectableButton.h"
#import "UIBarButtonItem+KMY.h"
#import "UIButton+KMY.h"

@interface KMYSelectableBarButtonItem ()

@property (nonatomic, weak)             KMYSelectableButton     *selectableButton;
@property (nonatomic, copy, nullable)   void                    (^handler)(__kindof UIBarButtonItem *buttonItem);

@end

@implementation KMYSelectableBarButtonItem

@dynamic selected;

+ (instancetype)buttonWithTitle:(nullable NSString *)title
                        handler:(void (^_Nullable)(__kindof KMYSelectableBarButtonItem *buttonItem))handler {
    return [[[self class] alloc] initWithSelectableButton:[KMYSelectableButton buttonForBarButtonCustomViewWithTitle:title]
                                              initializer:NULL
                                                  handler:handler];
}


+ (instancetype)buttonWithSystemItem:(UIBarButtonSystemItem)barButtonSystemItem
                             handler:(void (^_Nullable)(__kindof KMYSelectableBarButtonItem *buttonItem))handler {
    return [[[self class] alloc] initWithSelectableButton:[KMYSelectableButton buttonForBarButtonCustomViewWithBarButtonSystemItem:barButtonSystemItem]
                                              initializer:NULL
                                                  handler:handler];
}

- (instancetype)initWithSelectableButton:(KMYSelectableButton *)selectableButton
                             initializer:(void (^_Nullable)(__kindof KMYSelectableBarButtonItem *buttonItem))initializer
                                 handler:(void (^_Nullable)(__kindof KMYSelectableBarButtonItem *buttonItem))handler {

    self                    = [super initWithCustomView:selectableButton];
    self.selectableButton   = selectableButton;
    self.handler            = handler;

    KMY_WEAK(self, weakSelf);
    self.selectableButton.kmy_touchUpInsideHandler = ^(KMYSelectableButton *button) {
        KMY_STRONG(weakSelf, strongSelf);
        strongSelf.handler(strongSelf);
    };

    KMYInvokeBlockIfSet(initializer, self)

    return self;
}

- (BOOL)isSelected {
    return self.selectableButton.isSelected;
}

- (void)setSelected:(BOOL)selected {
    self.selectableButton.selected = selected;
}

#pragma mark - UIBarItem

- (void)setTitle:(NSString *)title {
    [self.selectableButton setTitle:title forState:self.selectableButton.isSelected ? UIControlStateSelected : UIControlStateNormal];
    [self.selectableButton sizeToFit];
}

@end


























