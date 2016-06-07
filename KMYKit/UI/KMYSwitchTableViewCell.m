//
//  KMYSwitchTableViewCell.m
//  KMYKit
//
//  Created by Karmeye on 03/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYSwitchTableViewCell.h"
#import "UIView+KMY.h"

@implementation KMYSwitchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];

    if (self) {

        self.selectionStyle = UITableViewCellSelectionStyleNone;

        _switchControl = [UISwitch kmy_viewWithInitializer:^(UISwitch *switchControl) {
            self.accessoryView = switchControl;
        }];
    }

    return self;
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    self.switchControl.onTintColor = self.tintColor;
}

#pragma mark KMYDefaultReusableIdentifying

+ (NSString *)defaultReuseIdentifier {
    return KMYDefaultReuseIdentifier();
}

@end
