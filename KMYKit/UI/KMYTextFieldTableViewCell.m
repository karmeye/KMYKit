//
//  KMYTextFieldTableViewCell.m
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTextFieldTableViewCell.h"

@implementation KMYTextFieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {

        self.selectionStyle = UITableViewCellSelectionStyleNone;

        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.spellCheckingType = UITextSpellCheckingTypeNo;
        _textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        _textField.autocorrectionType = UITextAutocorrectionTypeNo;

        [self.contentView addSubview:_textField];

        [NSLayoutConstraint activateConstraints:[NSArray kmy_arrayWithInitializer:^(NSMutableArray *c) {

            self.textField.translatesAutoresizingMaskIntoConstraints = NO;

            [c addObject:[NSLayoutConstraint constraintWithItem:self.textField
                                                      attribute:NSLayoutAttributeLeading
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeLeadingMargin
                                                     multiplier:1.0
                                                       constant:0]];

            [c addObject:[NSLayoutConstraint constraintWithItem:self.textField
                                                      attribute:NSLayoutAttributeTrailing
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeTrailingMargin
                                                     multiplier:1.0
                                                       constant:0]];

            [c addObject:[NSLayoutConstraint constraintWithItem:self.textField
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeTopMargin
                                                     multiplier:1.0
                                                       constant:0]];

            [c addObject:[NSLayoutConstraint constraintWithItem:self.textField
                                                      attribute:NSLayoutAttributeBottom
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.contentView
                                                      attribute:NSLayoutAttributeBottomMargin
                                                     multiplier:1.0
                                                       constant:0]];
        }]];
    }

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if (selected) {
        [self.textField becomeFirstResponder];
    }
}

#pragma mark KMYDefaultReusableIdentifying

+ (NSString *)defaultReuseIdentifier {
    return KMYDefaultReuseIdentifier();
}

@end


































