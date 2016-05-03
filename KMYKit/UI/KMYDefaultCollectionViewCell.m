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
    if (self) {

        // TODO: Layzily load

        _imageView = [UIImageView kmy_viewWithInitializer:^(UIImageView *imageView) {

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
            }]];
        }];


        _textLabel = [UILabel kmy_viewWithInitializer:^(UILabel *label) {

            label.translatesAutoresizingMaskIntoConstraints = NO;
            label.textAlignment = NSTextAlignmentCenter;
            label.numberOfLines = 2;
            label.font = [UIFont systemFontOfSize:18.f weight:UIFontWeightBold];

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
        }];

        _detailTextLabel = [UILabel kmy_viewWithInitializer:^(UILabel *label) {
            label.translatesAutoresizingMaskIntoConstraints = NO;
            label.numberOfLines = 2;
            label.font = [UIFont systemFontOfSize:12.f weight:UIFontWeightLight];
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

                [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                    attribute:NSLayoutAttributeBottomMargin
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:label
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0]];
            }]];
        }];
    }
    return self;
}

#pragma mark KMYDefaultReusableIdentifying

+ (NSString *)defaultReuseIdentifier {
    return KMYDefaultReuseIdentifier();
}

@end



































