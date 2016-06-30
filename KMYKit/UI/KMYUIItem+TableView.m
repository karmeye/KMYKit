//
//  KMYUIItem+TableView.m
//  KMYKit
//
//  Created on 26/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYUIItem+TableView.h"

NSString * const KMYUISectionKeyTableViewHeaderReuseIdentifier = @"KMYUISectionKeyTableViewHeaderReuseIdentifier";
NSString * const KMYUISectionKeyTableViewFooterReuseIdentifier = @"KMYUISectionKeyTableViewFooterReuseIdentifier";

NSString * const KMYUIItemKeyTableViewCellReuseIdentifier = @"KMYUIItemKeyTableViewCellReuseIdentifier";

@implementation KMYUISection (TableView)

@dynamic tableViewHeaderReuseIdentifier;
@dynamic tableViewFooterReuseIdentifier;

- (NSString *)tableViewHeaderReuseIdentifier {
    return [self valueForAttribute:KMYUISectionKeyTableViewHeaderReuseIdentifier];
}

- (NSString *)tableViewFooterReuseIdentifier {
    return [self valueForAttribute:KMYUISectionKeyTableViewFooterReuseIdentifier];
}

@end

@implementation KMYUIItem (TableView)

@dynamic tableViewCellReuseIdentifier;

- (NSString *)tableViewCellReuseIdentifier {
    return [self valueForAttribute:KMYUIItemKeyTableViewCellReuseIdentifier];
}

@end
