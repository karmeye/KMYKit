//
//  NSLayoutAnchor+KMY.h
//  KMYKit
//
//  Created on 18/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutAnchor (KMY)

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor *)anchor                priority:(UILayoutPriority)priority;
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor      priority:(UILayoutPriority)priority;
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor   priority:(UILayoutPriority)priority;

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor *)anchor                constant:(CGFloat)c priority:(UILayoutPriority)priority;
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor      constant:(CGFloat)c priority:(UILayoutPriority)priority;
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor   constant:(CGFloat)c priority:(UILayoutPriority)priority;

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor*)anchor                 identifier:(nullable NSString *)identifier;
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor      identifier:(nullable NSString *)identifier;
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor   identifier:(nullable NSString *)identifier;

@end

@interface NSLayoutDimension (KMY)

- (NSLayoutConstraint *)kmy_constraintEqualToConstant:(CGFloat)c                priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier;
- (NSLayoutConstraint *)kmy_constraintLessThanOrToConstant:(CGFloat)c           priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier;
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToConstant:(CGFloat)c   priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier;

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier;
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier;
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier;

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier;
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier;
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
