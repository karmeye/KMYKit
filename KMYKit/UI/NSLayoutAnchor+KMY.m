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
    NSLayoutConstraint *constraint = [self constraintEqualToAnchor:anchor];
    constraint.priority = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor priority:(UILayoutPriority)priority {
    NSLayoutConstraint *constraint = [self constraintGreaterThanOrEqualToAnchor:anchor];
    constraint.priority = priority;
    return constraint;
}

- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor priority:(UILayoutPriority)priority {
    NSLayoutConstraint *constraint = [self constraintLessThanOrEqualToAnchor:anchor];
    constraint.priority = priority;
    return constraint;
}

@end
