//
//  NSLayoutAnchor+KMY.m
//  KMYKit
//
//  Created on 18/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSLayoutAnchor+KMY.h"

@implementation NSLayoutAnchor (KMY)

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor *)anchor priority:(UILayoutPriority)priority {
    NSLayoutConstraint *constraint  = [self constraintEqualToAnchor:anchor];
    constraint.priority             = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor priority:(UILayoutPriority)priority {
    NSLayoutConstraint *constraint  = [self constraintLessThanOrEqualToAnchor:anchor];
    constraint.priority             = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor priority:(UILayoutPriority)priority {
    NSLayoutConstraint *constraint  = [self constraintGreaterThanOrEqualToAnchor:anchor];
    constraint.priority             = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c priority:(UILayoutPriority)priority {
    NSLayoutConstraint *constraint  = [self constraintEqualToAnchor:anchor constant:c];
    constraint.priority             = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c priority:(UILayoutPriority)priority {
    NSLayoutConstraint *constraint  = [self constraintLessThanOrEqualToAnchor:anchor constant:c];
    constraint.priority             = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c priority:(UILayoutPriority)priority {
    NSLayoutConstraint *constraint  = [self constraintGreaterThanOrEqualToAnchor:anchor constant:c];
    constraint.priority             = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor*)anchor identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintEqualToAnchor:anchor];
    constraint.identifier           = identifier;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintLessThanOrEqualToAnchor:anchor];
    constraint.identifier           = identifier;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintGreaterThanOrEqualToAnchor:anchor];
    constraint.identifier           = identifier;
    return constraint;
}

@end

@implementation NSLayoutDimension (KMY)

- (NSLayoutConstraint *)kmy_constraintEqualToConstant:(CGFloat)c                priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintEqualToConstant:c];
    constraint.priority             = priority;
    constraint.identifier           = identifier;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintLessThanOrToConstant:(CGFloat)c           priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintLessThanOrEqualToConstant:c];
    constraint.priority             = priority;
    constraint.identifier           = identifier;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToConstant:(CGFloat)c   priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintGreaterThanOrEqualToConstant:c];
    constraint.priority             = priority;
    constraint.identifier           = identifier;
    return constraint;
}

#pragma mark -

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintEqualToAnchor:anchor multiplier:m constant:c];
    constraint.identifier           = identifier;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintLessThanOrEqualToAnchor:anchor multiplier:m constant:c];
    constraint.identifier           = identifier;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    multiplier:(CGFloat)m constant:(CGFloat)c identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintGreaterThanOrEqualToAnchor:anchor multiplier:m constant:c];
    constraint.identifier           = identifier;
    return constraint;
}

#pragma mark -

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint = [self kmy_constraintEqualToAnchor:anchor multiplier:1.0f constant:0 identifier:identifier];
    constraint.priority = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint = [self kmy_constraintLessThanOrEqualToAnchor:anchor multiplier:1.0f constant:0 identifier:identifier];
    constraint.priority = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint = [self kmy_constraintGreaterThanOrEqualToAnchor:anchor multiplier:1.0f constant:0 identifier:identifier];
    constraint.priority = priority;
    return constraint;
}

#pragma mark -

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutDimension *)anchor                 multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintEqualToAnchor:anchor multiplier:m constant:c];
    constraint.identifier           = identifier;
    constraint.priority             = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor       multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintLessThanOrEqualToAnchor:anchor multiplier:m constant:c];
    constraint.identifier           = identifier;
    constraint.priority             = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor    multiplier:(CGFloat)m constant:(CGFloat)c priority:(UILayoutPriority)priority identifier:(nullable NSString *)identifier {
    NSLayoutConstraint *constraint  = [self constraintGreaterThanOrEqualToAnchor:anchor multiplier:m constant:c];
    constraint.identifier           = identifier;
    constraint.priority             = priority;
    return constraint;
}

@end




































