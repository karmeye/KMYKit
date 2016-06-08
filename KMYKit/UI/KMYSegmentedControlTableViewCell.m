//
//  KMYSegmentedControlTableViewCell.m
//  KMYKit
//
//  Created on 03/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYSegmentedControlTableViewCell.h"
#import "UIView+KMY.h"

@implementation KMYSegmentedControlTableViewCell {
    UILabel *_textLabel;
}

@dynamic textLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];

    if (self) {

        self.selectionStyle = UITableViewCellSelectionStyleNone;

        _segmentedControl = [UISegmentedControl kmy_viewWithInitializer:^(UISegmentedControl *segmentedControl) {
            segmentedControl.apportionsSegmentWidthsByContent = YES;
            [self.contentView addSubview:segmentedControl];
        }];

        _textLabel = [UILabel kmy_viewWithInitializer:^(UILabel *label) {
            label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
            [self.contentView addSubview:label];
        }];

        [NSLayoutConstraint activateConstraints:[NSArray kmy_arrayWithInitializer:^(NSMutableArray *c) {

            self.segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
            self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;

            [c addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                      attribute:NSLayoutAttributeHeight
                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                         toItem:nil
                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                     multiplier:1.0f
                                                       constant:44.0f]];

            [c addObject:[NSLayoutConstraint constraintWithItem:self.segmentedControl
                                                      attribute:NSLayoutAttributeCenterYWithinMargins
                                                      relatedBy:NSLayoutRelationLessThanOrEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeCenterYWithinMargins
                                                     multiplier:1.0f
                                                       constant:0]];

            [c addObject:[NSLayoutConstraint constraintWithItem:self.segmentedControl
                                                      attribute:NSLayoutAttributeLeading
                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeLeadingMargin
                                                     multiplier:1.0
                                                       constant:0]];

            [c addObject:[NSLayoutConstraint constraintWithItem:self.segmentedControl
                                                      attribute:NSLayoutAttributeTrailing
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeTrailingMargin
                                                     multiplier:1.0
                                                       constant:0]];

            [c addObject:[NSLayoutConstraint constraintWithItem:self.segmentedControl
                                                      attribute:NSLayoutAttributeLeading
                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                         toItem:self.textLabel
                                                      attribute:NSLayoutAttributeTrailing
                                                     multiplier:1.0
                                                       constant:0.f]];

            [c addObject:[NSLayoutConstraint constraintWithItem:self.textLabel
                                                      attribute:NSLayoutAttributeLeading
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeLeadingMargin
                                                     multiplier:1.0
                                                       constant:0]];

            [c addObject:[NSLayoutConstraint constraintWithItem:self.textLabel
                                                      attribute:NSLayoutAttributeCenterYWithinMargins
                                                      relatedBy:NSLayoutRelationLessThanOrEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeCenterYWithinMargins
                                                     multiplier:1.0f
                                                       constant:0]];
        }]];
    }

    return self;
}

- (void)tintColorDidChange {
    [super tintColorDidChange];

    self.segmentedControl.tintColor = self.tintColor;
}

- (void)prepareForReuse {
    [_segmentedControl removeTarget:nil action:nil forControlEvents:UIControlEventAllEvents];
    [_segmentedControl removeAllSegments];
}

- (UILabel *)textLabel {
    return _textLabel;
}

#pragma mark KMYDefaultReusableIdentifying

+ (NSString *)defaultReuseIdentifier {
    return KMYDefaultReuseIdentifier();
}

@end






















