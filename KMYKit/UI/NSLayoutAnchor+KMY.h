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

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor *)anchor                priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmy_constraint(equalTo:priority:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor      priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmy_constraint(lessThanOrEqualTo:priority:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor   priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmy_constraint(greaterThanOrEqualTo:priority:));

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor *)anchor                constant:(CGFloat)c priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmy_constraint(equalTo:constant:priority:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor      constant:(CGFloat)c priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmy_constraint(lessThanOrEqualTo:constant:priority:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor   constant:(CGFloat)c priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmy_constraint(greaterThanOrEqualTo:constant:priority:));

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor*)anchor                 identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(equalTo:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor      identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(lessThanOrEqualTo:identifier:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor   identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(greaterThanOrEqualTo:identifier:));

@end

@interface NSLayoutDimension (KMY)

- (NSLayoutConstraint *)kmy_constraintEqualToConstant:(CGFloat)c                priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(equalToConstant:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrToConstant:(CGFloat)c           priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(lessThanOrEqualToConstant:priority:identifier:));;
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToConstant:(CGFloat)c   priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(greaterThanOrEqualToConstant:priority:identifier:));;

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(equalTo:multiplier:constant:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(lessThanOrEqualTo:multiplier:constant:identifier:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(greaterThanOrEqualTo:multiplier:constant:identifier:));

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(equalTo:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(lessThanOrEqualTo:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(greaterThanOrEqualTo:priority:identifier:));

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(equalTo:multiplier:constant:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(lessThanOrEqualTo:multiplier:constant:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmy_constraint(greaterThanOrEqualTo:multiplier:constant:priority:identifier:));

@end

NS_ASSUME_NONNULL_END
