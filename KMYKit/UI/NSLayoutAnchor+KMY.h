//
//  NSLayoutAnchor+KMY.h
//  KMYKit
//
//  Created on 18/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutAnchor<AnchorType> (KMY)

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor<AnchorType> *)anchor                priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmyConstraint(equalTo:priority:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor<AnchorType> *)anchor      priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmyConstraint(lessThanOrEqualTo:priority:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor<AnchorType> *)anchor   priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmyConstraint(greaterThanOrEqualTo:priority:));

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor<AnchorType> *)anchor                constant:(CGFloat)c priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmyConstraint(equalTo:constant:priority:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor<AnchorType> *)anchor      constant:(CGFloat)c priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmyConstraint(lessThanOrEqualTo:constant:priority:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor<AnchorType> *)anchor   constant:(CGFloat)c priority:(UILayoutPriority)priority NS_SWIFT_NAME(kmyConstraint(greaterThanOrEqualTo:constant:priority:));

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor<AnchorType> *)anchor                identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(equalTo:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor<AnchorType> *)anchor      identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(lessThanOrEqualTo:identifier:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor<AnchorType> *)anchor   identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(greaterThanOrEqualTo:identifier:));

@end

@interface NSLayoutDimension (KMY)

- (NSLayoutConstraint *)kmy_constraintEqualToConstant:(CGFloat)c                priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(equalToConstant:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrToConstant:(CGFloat)c           priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(lessThanOrEqualToConstant:priority:identifier:));;
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToConstant:(CGFloat)c   priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(greaterThanOrEqualToConstant:priority:identifier:));;

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(equalTo:multiplier:constant:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(lessThanOrEqualTo:multiplier:constant:identifier:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(greaterThanOrEqualTo:multiplier:constant:identifier:));

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(equalTo:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(lessThanOrEqualTo:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(greaterThanOrEqualTo:priority:identifier:));

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(equalTo:multiplier:constant:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(lessThanOrEqualTo:multiplier:constant:priority:identifier:));
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier NS_SWIFT_NAME(kmyConstraint(greaterThanOrEqualTo:multiplier:constant:priority:identifier:));

@end

NS_ASSUME_NONNULL_END
