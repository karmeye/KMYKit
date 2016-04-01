//
//  KMYSubtitleStyleTableViewCell.m
//  KMYKit
//
//  Created on 01/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYSubtitleStyleTableViewCell.h"

@implementation KMYSubtitleStyleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
}

#pragma mark KMYDefaultReusableIdentifying

+ (NSString *)defaultReuseIdentifier {
    return KMYDefaultReuseIdentifier();
}

@end
