//
//  KMYDefaultStyleTableViewCell.m
//  KMYKit
//
//  Created on 30/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYDefaultStyleTableViewCell.h"

@implementation KMYDefaultStyleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    return [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
}

#pragma mark KMYDefaultReusableIdentifying

+ (NSString *)defaultReuseIdentifier {
    return KMYDefaultReuseIdentifier();
}

@end
