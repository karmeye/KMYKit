//
//  NSLayoutConstraint+KMY.m
//  KMYKit
//
//  Created on 25/07/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSLayoutConstraint+KMY.h"
#import <KMYKit/KMY+Foundation.h>

@implementation NSLayoutConstraint (KMY)

+ (NSArray<__kindof NSLayoutConstraint *> *)kmy_constraintsForView:(UIView *)view1 equalToEdgesOfView:(UIView *)view2 {
    return [[self class] kmy_constraintsForView:view1 equalToEdgesOfView:view2 options:0];
}

+ (NSArray<__kindof NSLayoutConstraint *> *)kmy_constraintsForView:(UIView *)view1 equalToEdgesOfView:(UIView *)view2 options:(KMYLayoutConstraintOptions)options {
    return [NSArray kmy_arrayWithInitializer:^(NSMutableArray *constraints) {

        view1.translatesAutoresizingMaskIntoConstraints = NO;

        BOOL useLeadingTrailing = options & KMYLayoutConstraintOptionUseLeadingTrailing;

        if (!(options & KMYLayoutConstraintOptionOmitLeft)) {
            NSLayoutAttribute attribute = useLeadingTrailing ? NSLayoutAttributeLeading : NSLayoutAttributeLeft;
            [constraints addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view2 attribute:attribute multiplier:1.0 constant:0]];
        }

        if (!(options & KMYLayoutConstraintOptionOmitRight)) {
            NSLayoutAttribute attribute = useLeadingTrailing ? NSLayoutAttributeTrailing : NSLayoutAttributeRight;
            [constraints addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view2 attribute:attribute multiplier:1.0 constant:0]];
        }

        if (!(options & KMYLayoutConstraintOptionOmitTop)) {
            [constraints addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
        }

        if (!(options & KMYLayoutConstraintOptionOmitBottom)) {
            [constraints addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
        }
    }];
}

+ (NSArray<__kindof NSLayoutConstraint *> *)kmy_constraintsForView:(UIView *)view1 equalToMarginsOfView:(UIView *)view2 {
    return [[self class] kmy_constraintsForView:view1 equalToMarginsOfView:view2 options:0];
}

+ (NSArray<__kindof NSLayoutConstraint *> *)kmy_constraintsForView:(UIView *)view1 equalToMarginsOfView:(UIView *)view2 options:(KMYLayoutConstraintOptions)options {
    return [NSArray kmy_arrayWithInitializer:^(NSMutableArray *constraints) {

        view1.translatesAutoresizingMaskIntoConstraints = NO;

        BOOL useLeadingTrailing = options & KMYLayoutConstraintOptionUseLeadingTrailing;

        if (!(options & KMYLayoutConstraintOptionOmitLeft)) {
            [constraints addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:useLeadingTrailing ? NSLayoutAttributeLeading : NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view2 attribute:useLeadingTrailing ? NSLayoutAttributeLeadingMargin : NSLayoutAttributeLeftMargin multiplier:1.0 constant:0]];
        }

        if (!(options & KMYLayoutConstraintOptionOmitRight)) {
            [constraints addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:useLeadingTrailing ? NSLayoutAttributeTrailing : NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view2 attribute:useLeadingTrailing ? NSLayoutAttributeTrailingMargin : NSLayoutAttributeRightMargin multiplier:1.0 constant:0]];
        }

        if (!(options & KMYLayoutConstraintOptionOmitTop)) {
            [constraints addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0]];
        }

        if (!(options & KMYLayoutConstraintOptionOmitBottom)) {
            [constraints addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0]];
        }
    }];
}

@end
































