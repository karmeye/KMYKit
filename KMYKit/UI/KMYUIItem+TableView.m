//
//  KMYUIItem+TableView.m
//  KMYKit
//
//  Created on 26/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYUIItem+TableView.h"

NSString * const KMYUIItemKeyTableViewReuseIdentifier = @"KMYUIItemKeyTableViewReuseIdentifier";

@implementation KMYUIItem (TableView)

@dynamic tableViewReuseIdentifier;

- (NSString *)tableViewReuseIdentifier {
    return [self valueForAttribute:KMYUIItemKeyTableViewReuseIdentifier];
}

@end
