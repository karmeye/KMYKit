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

        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        self.contentView.layoutMargins = UIEdgeInsetsMake(0,0,0,0);

        NSMutableArray *constraints = [NSMutableArray array];

        [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                            attribute:NSLayoutAttributeLeftMargin
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:_textField
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:0]];

        [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                            attribute:NSLayoutAttributeRightMargin
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:_textField
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.0
                                                             constant:0]];

        [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                            attribute:NSLayoutAttributeTopMargin
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:_textField
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1.0
                                                             constant:0]];

        [constraints addObject:[NSLayoutConstraint constraintWithItem:self.contentView
                                                            attribute:NSLayoutAttributeBottomMargin
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:_textField
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1.0
                                                             constant:0]];

        [NSLayoutConstraint activateConstraints:constraints];

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


































