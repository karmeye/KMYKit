//
//  KMYDestructiveButtonTableViewCell.m
//  KMYKit
//
//  Created on 12/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYDestructiveButtonTableViewCell.h"

@implementation KMYDestructiveButtonTableViewCell

- (void)tintColorDidChange {
    [super tintColorDidChange];
    self.textLabel.textColor = self.destructiveColor ?: [UIColor redColor];
}

#pragma mark KMYDefaultReusableIdentifying

+ (NSString *)defaultReuseIdentifier {
    return KMYDefaultReuseIdentifier();
}

@end
