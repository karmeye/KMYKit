//
//  KMYButtonTableViewCell.m
//  KMYKit
//
//  Created on 12/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYButtonTableViewCell.h"

@implementation KMYButtonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =  [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    self.textLabel.textColor = self.tintColor;
}

#pragma mark KMYDefaultReusableIdentifying

+ (NSString *)defaultReuseIdentifier {
    return KMYDefaultReuseIdentifier();
}

@end
