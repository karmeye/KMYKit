//
//  KMYSelectableButton.m
//  KMYKit
//
//  Created on 2017-01-31.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import "KMYSelectableButton.h"
#import "KMY+Foundation.h"
#import "UIView+KMY.h"
#import "UIBarButtonItem+KMY.h"
#import "NSLayoutConstraint+KMY.h"
#import "UIToolbar+KMY.h"

@interface KMYSelectableButton ()

/// Created if the receiver was initialized with a UIBarButtonSystemItem.
@property (nonatomic, weak)         UIToolbar           *toolbar;

@property (nonatomic, strong)       NSLayoutConstraint  *toolbarHeightEqualToSelfConstraint;
@property (nonatomic, strong)       NSLayoutConstraint  *toolbarHeightConstraint;

@property (nonatomic, assign)       BOOL                isManagedByBarButtonItem;
@property (nonatomic, assign)       CGFloat             defaultToolbarHeight;
@property (nonatomic, assign)       BOOL                isObservingSuperviewBounds;

@end

@implementation KMYSelectableButton

+ (void)initialize {
    if (self != [KMYSelectableButton class]) return;

    KMYSelectableButton *appearance = [KMYClass() appearance];
    appearance.cornerRadius         = 6.f;
}

+ (instancetype)button {
    return [[self class] buttonWithTitle:nil];
}

+ (instancetype)buttonWithTitle:(NSString *)title {
    KMYSelectableButton *button = [[self class] buttonWithType:UIButtonTypeCustom];
    [button configureAsSelectableButtonWithTitle:title];
    return button;
}

+ (instancetype)buttonWithBarButtonSystemItem:(UIBarButtonSystemItem)barButtonSystemItem {
    KMYSelectableButton *button = [[self class] buttonWithType:UIButtonTypeCustom];
    [button configureAsSelectableButtonWithBarButtonSystemItem:barButtonSystemItem];
    return button;
}

- (void)dealloc {
    [self enableObservingBoundsForSuperview:NO];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}

#pragma mark - UIButton

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
}

#pragma mark - UIView

- (CGSize)sizeThatFits:(CGSize)size {

    CGSize const sizeThatFits = [super sizeThatFits:size];

    if (self.isManagedByBarButtonItem) {

        // The height affects the vertical position of the contained UIBarButtonItem
        // For a superview toolbar height of 44, 35 is the correct height for the receiver vertical position of the contained UIBarButtonItem matches other UIBarButtonItems.

        CGFloat height = [self heightForManagedByBarButtonItem];

        if (self.toolbar) {
            [self setToolbarHeightEqualToSuperviewsHeight];
            return CGSizeMake(sizeThatFits.width, height);
        } else {
            return CGSizeMake(sizeThatFits.width, height);
        }

    } else {
        return sizeThatFits;
    }
}

- (void)willMoveToSuperview:(UIView*)superview {
    [super willMoveToSuperview:superview];
    [self barButtonItemSupport_willMoveToSuperview:superview];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self barButtonItemSupport_didMoveToSuperview];
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    [self updateTintColor];
}

#pragma mark - UIControl

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self updateTintColor];
}

#pragma mark - Private -

- (void)configureAsSelectableButtonWithTitle:(NSString *)title {

    self.titleLabel.font    = [UIFont systemFontOfSize:UIFont.labelFontSize];
    self.contentEdgeInsets  = UIEdgeInsetsMake(4.f, 4.f, 4.f, 4.f);

    if (title) {
        [self setTitle:title forState:UIControlStateNormal];
    }
}

- (void)configureAsSelectableButtonWithBarButtonSystemItem:(UIBarButtonSystemItem)barButtonSystemItem {

    self.clipsToBounds = YES;

    [self addSubview:[UIToolbar kmy_viewWithInitializer:^(UIToolbar *toolbar) {

        self.toolbar                    = toolbar;

        toolbar.barStyle                = UIBarStyleDefault;
        toolbar.backgroundColor         = UIColor.clearColor;
        toolbar.clipsToBounds           = YES;
        toolbar.userInteractionEnabled  = NO;

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(1.f, 1.f), NO, 0.0);
        UIImage *transparentImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        [toolbar setBackgroundImage:[transparentImage resizableImageWithCapInsets:UIEdgeInsetsMake(1.f, 0.f, 0.f, 0.f)
                                                                     resizingMode:UIImageResizingModeTile]
                 forToolbarPosition:UIBarPositionAny
                         barMetrics:UIBarMetricsDefault];

        UIBarButtonItem *barButtonItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:barButtonSystemItem target:nil action:nil];
        toolbar.items                   = @[[UIBarButtonItem kmy_buttonWithFlexibleSpace], barButtonItem, [UIBarButtonItem kmy_buttonWithFlexibleSpace]];
    }]];

    self.toolbar.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:[NSArray kmy_arrayWithInitializer:^(NSMutableArray * _Nonnull c) {

        [c addObject:[self.toolbar.centerXAnchor    constraintEqualToAnchor:self.centerXAnchor]];
        [c addObject:[self.toolbar.centerYAnchor    constraintEqualToAnchor:self.centerYAnchor constant:0]];
        [c addObject:[self.toolbar.widthAnchor      constraintEqualToAnchor:self.widthAnchor multiplier:1.0f]];

        self.toolbarHeightEqualToSelfConstraint = [self.toolbar.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:1.0f];
        [c addObject:self.toolbarHeightEqualToSelfConstraint];
    }]];
}

- (void)updateTintColor {

    UIColor *tintColor          = self.tintColor;
    UIColor *counterTintColor   = [UIColor.whiteColor colorWithAlphaComponent:1.0f];

    if (self.selected) {
        self.backgroundColor = tintColor;

        if (self.toolbar) {
            self.toolbar.tintColor = counterTintColor;
        } else {
            [self setTitleColor:counterTintColor forState:UIControlStateSelected];
        }
    } else {
        self.backgroundColor = UIColor.clearColor;

        if (self.toolbar) {
            self.toolbar.tintColor = tintColor;
        } else {
            [self setTitleColor:tintColor forState:UIControlStateNormal];
        }
    }
}

#pragma mark - UIBarButtonItemSupport -

+ (instancetype)buttonForBarButtonCustomViewWithTitle:(nullable NSString *)title {
    KMYSelectableButton *button = [[self class] buttonWithTitle:title];
    [button configureAsManagedByBarButtonItem];
    return button;
}

+ (instancetype)buttonForBarButtonCustomViewWithBarButtonSystemItem:(UIBarButtonSystemItem)barButtonSystemItem {
    KMYSelectableButton *button = [[self class] buttonWithBarButtonSystemItem:barButtonSystemItem];
    [button configureAsManagedByBarButtonItem];
    return button;
}

#pragma mark - Private -

- (void)configureAsManagedByBarButtonItem {

    self.isManagedByBarButtonItem = YES;

    if (self.toolbar) {

        // Get default height
        self.toolbarHeightConstraint = [self.toolbar.heightAnchor constraintEqualToConstant:UIToolbar.kmy_defaultHeight];

        // In this case, when managed by a UIBarButtonItem and initialized with a UIBarButtonSystemItem, we want the height of the toolbar to be equal to the UINavigationbar or UIToolbar managing the UIBarButtonItem. Because it’s not allowed to make a height constraint with a UINavigationbar or UIToolbar managed by a controller, we need to adjust the height ourselves.

        self.toolbarHeightEqualToSelfConstraint.active  = NO;
        self.toolbarHeightConstraint.active             = YES;

        if (self.superview) {
            [self setToolbarHeightEqualToSuperviewsHeight];
        }
    }
}

- (void)barButtonItemSupport_willMoveToSuperview:(UIView*)superview {
    if (!superview) {
        [self enableObservingBoundsForSuperview:NO];
    }
}

- (void)barButtonItemSupport_didMoveToSuperview {
    if (self.superview && self.isManagedByBarButtonItem) {
        [self enableObservingBoundsForSuperview:YES];
        [self sizeToFit];
    }
}

- (void)enableObservingBoundsForSuperview:(BOOL)enable {
    static NSString * const keyPath = @"bounds";

    if (enable && !self.isObservingSuperviewBounds) {
        self.isObservingSuperviewBounds = YES;
        [self.superview addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
    } else if (!enable && self.isObservingSuperviewBounds) {
        self.isObservingSuperviewBounds = NO;
        @try {
            [self.superview removeObserver:self forKeyPath:keyPath];
        } @catch (NSException *exception) {}
    }

}

- (CGFloat)heightForManagedByBarButtonItem {
    KMYAssertDebug(self.isManagedByBarButtonItem);

    // The 0.78f factor is used to get a reasonable height in compact mode.
    return ceil((self.superview ? CGRectGetHeight(self.superview.bounds) : UIToolbar.kmy_defaultHeight) * 0.78f);
}

/// To ensure that the UIBarButtonSystemItem icons are the correct size, the toolbar that they are added to must have the same height as the @c UINavigationBar or UIToolbar the UIBarButtonItem was added to.
- (void)setToolbarHeightEqualToSuperviewsHeight {
    KMYAssertDebug(self.isManagedByBarButtonItem);

    if (self.isManagedByBarButtonItem && self.toolbar) {
        if (self.superview) {
            KMYAssertDebug([self.superview isKindOfClass:[UINavigationBar class]] || [self.superview isKindOfClass:[UIToolbar class]], @"You must add this the UIBarButtonItem that contains this button to either a UINavigationBar or a UIToolbar.");
            self.toolbarHeightConstraint.constant = CGRectGetHeight(self.superview.bounds);
        }
    }
}

#pragma mark NSKeyValueObserving

- (void)observeValueForKeyPath:(nullable NSString *)keyPath
                      ofObject:(nullable id)object
                        change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change
                       context:(nullable void *)context {
    KMYAssertDebug(self.superview);

    if (self.isManagedByBarButtonItem) {
        [self setToolbarHeightEqualToSuperviewsHeight];
        self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, [self heightForManagedByBarButtonItem]);
    }
}


@end























































