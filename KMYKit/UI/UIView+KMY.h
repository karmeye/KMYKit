//
//  UIView+KMY.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (KMY)

+ (instancetype)kmy_view NS_SWIFT_UNAVAILABLE("Use default initializer: UIView()");

/// Calls initWithFrame:. Supports subclasses (UILabel etc.)
///
/// @param frame       Frame for initWithFrame:.
/// @param initializer Use to customize the newly allocated UIView.
///
/// @return A new UIView or subclass.
+ (instancetype)kmy_viewWithFrame:(CGRect)frame initializer:(void (^_Nullable)(__kindof UIView *view))initializer NS_SWIFT_NAME(init(frame:initializer:));

+ (instancetype)kmy_viewWithInitializer:(void (^_Nullable)(__kindof UIView *view))initializer NS_SWIFT_NAME(init(initializer:));

@end

typedef NS_OPTIONS(NSUInteger, KMYLayoutAxis) {
    KMYLayoutConstraintAxisNone         = 0,
    KMYLayoutConstraintAxisVertical     = 1UL << 0,
    KMYLayoutConstraintAxisHorizontal   = 1UL << 1,
    KMYLayoutConstraintAxisAll          = NSUIntegerMax
};

typedef NS_OPTIONS(NSUInteger, KMYLayoutTradeoff) {
    KMYLayoutTradeoffNone                   = 0,
    KMYLayoutTradeoffCompressionResistance  = 1UL << 0,
    KMYLayoutTradeoffHugging                = 1UL << 1,
    KMYLayoutTradeoffAll                    = NSUIntegerMax
};

@interface UIView (KMYUIConstraintBasedLayoutLayering)

- (void)kmy_setLayoutTradeoff:(KMYLayoutTradeoff)tradeoff priority:(UILayoutPriority)priority forAxis:(KMYLayoutAxis)axis;

/// Sets @c translatesAutoresizingMaskIntoConstraints to @c NO on given views.
+ (void)kmy_enableLayoutConstraintsOnViews:(NSArray<UIView *> *)views NS_SWIFT_NAME(kmy_enableLayoutConstraints(_:));

@end

NS_ASSUME_NONNULL_END
