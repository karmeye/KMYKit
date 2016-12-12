//
//  UIFont+KMY.m
//  KMYKit
//
//  Created on 2016-12-12.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "UIFont+KMY.h"

@implementation UIFont (KMY)

+ (void)kmy_logAllInstalled {

    NSArray *familyNames = [[UIFont familyNames] sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString * obj2) {
        return [obj1 caseInsensitiveCompare:obj2];
    }];

    for (NSString *familyName in familyNames) {
        NSLog(@"%@", familyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"\t%@", fontName);
        }
    }
}

@end
