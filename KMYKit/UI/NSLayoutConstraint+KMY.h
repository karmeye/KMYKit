//
//  NSLayoutConstraint+KMY.h
//  KMYKit
//
//  Created on 25/07/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, KMYLayoutConstraintOptions) {
    KMYLayoutConstraintOptionNone                       = 0,
    KMYLayoutConstraintOptionUseLeadingTrailing         = 1UL << 0,
    KMYLayoutConstraintOptionOmitTop                    = 1UL << 1,
    KMYLayoutConstraintOptionOmitLeft                   = 1UL << 2,
    KMYLayoutConstraintOptionOmitBottom                 = 1UL << 3,
    KMYLayoutConstraintOptionOmitRight                  = 1UL << 4,
};

@interface NSLayoutConstraint (KMY)

+ (NSArray<__kindof NSLayoutConstraint *> *)kmy_constraintsForView:(UIView *)view1 equalToEdgesOfView:(UIView *)view2;
+ (NSArray<__kindof NSLayoutConstraint *> *)kmy_constraintsForView:(UIView *)view1 equalToEdgesOfView:(UIView *)view2 options:(KMYLayoutConstraintOptions)options;

+ (NSArray<__kindof NSLayoutConstraint *> *)kmy_constraintsForView:(UIView *)view1 equalToMarginsOfView:(UIView *)view2;
+ (NSArray<__kindof NSLayoutConstraint *> *)kmy_constraintsForView:(UIView *)view1 equalToMarginsOfView:(UIView *)view2 options:(KMYLayoutConstraintOptions)options;

@end

NS_ASSUME_NONNULL_END