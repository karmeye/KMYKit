//
//  KMYUIItem+TableView.h
//  KMYKit
//
//  Created on 26/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <KMYKit/KMYUIItem.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const KMYUIItemKeyTableViewReuseIdentifier;

@interface KMYUIItem (TableView)

@property (nonatomic, readonly, nullable)   NSString    *tableViewReuseIdentifier;

@end

NS_ASSUME_NONNULL_END