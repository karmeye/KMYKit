//
//  KMYDefaultCollectionViewCell.m
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYDefaultCollectionViewCell.h"
#import "UIView+KMY.h"
#import "UIImageView+KMY.h"

@implementation KMYDefaultCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    // TODO: Layzily load

    _imageView = [UIImageView kmy_viewWithInitializer:^(UIImageView *imageView) {

        imageView.backgroundColor = UIColor.grayColor;
        imageView.translatesAutoresizingMaskIntoConstraints = NO;

        [self.contentView addSubview:imageView];

        [NSLayoutConstraint activateConstraints:[NSArray kmy_arrayWithInitializer:^(NSMutableArray *constraints) {

            [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeLeftMargin
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:imageView
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1.0
                                                                 constant:0]];

            [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeRightMargin
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:imageView
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1.0
                                                                 constant:0]];

            [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeTopMargin
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:imageView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:0]];

            [constraints addObject:[NSLayoutConstraint constraintWithItem:imageView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.contentView
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:0.4f
                                                                 constant:0]];
        }]];
    }];

    _textLabel = [UILabel kmy_viewWithInitializer:^(UILabel *label) {

        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];

        [self.contentView addSubview:label];
        [NSLayoutConstraint activateConstraints:[NSArray kmy_arrayWithInitializer:^(NSMutableArray *constraints) {

            [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeLeadingMargin
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:label
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:0]];

            [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeTrailingMargin
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:label
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0]];

            [constraints addObject:[NSLayoutConstraint constraintWithItem:self.imageView
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:label
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:-10.f]];
        }]];

        [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    }];

    _detailTextLabel = [UILabel kmy_viewWithInitializer:^(UILabel *label) {
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.numberOfLines = 0;
        label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];

        [self.contentView addSubview:label];
        [NSLayoutConstraint activateConstraints:[NSArray kmy_arrayWithInitializer:^(NSMutableArray *constraints) {

            [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeLeadingMargin
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:label
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:0]];

            [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                attribute:NSLayoutAttributeTrailingMargin
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:label
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0]];

            [constraints addObject:[NSLayoutConstraint constraintWithItem:self.textLabel
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:label
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:-10.f]];

            [constraints addObject:[NSLayoutConstraint constraintWithItem:label
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationLessThanOrEqual
                                                                   toItem:self.contentView
                                                                attribute:NSLayoutAttributeBottomMargin
                                                               multiplier:1.0
                                                                 constant:0]];
        }]];

        [label setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
    }];

    return self;
}

#pragma mark KMYDefaultReusableIdentifying

+ (NSString *)defaultReuseIdentifier {
    return KMYDefaultReuseIdentifier();
}

@end



































