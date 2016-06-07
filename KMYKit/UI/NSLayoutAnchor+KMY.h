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

- (NSLayoutConstraint *)kmy_constraintEqualToAnchor:(NSLayoutAnchor*)anchor priority:(UILayoutPriority)priority;
- (NSLayoutConstraint *)kmy_constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor priority:(UILayoutPriority)priority;
- (NSLayoutConstraint *)kmy_constraintLessThanOrEqualToAnchor:(NSLayoutAnchor *)anchor priority:(UILayoutPriority)priority;

@end

NS_ASSUME_NONNULL_END
