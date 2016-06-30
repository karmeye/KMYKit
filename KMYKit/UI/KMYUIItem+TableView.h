//
//  KMYUIItem+TableView.h
//  KMYKit
//
//  Created on 26/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <KMYKit/KMYUISection.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString * const KMYUISectionKeyTableViewHeaderReuseIdentifier;
UIKIT_EXTERN NSString * const KMYUISectionKeyTableViewFooterReuseIdentifier;

UIKIT_EXTERN NSString * const KMYUIItemKeyTableViewCellReuseIdentifier;

@interface KMYUISection (TableView)

@property (nonatomic, readonly, nullable)   NSString    *tableViewHeaderReuseIdentifier;
@property (nonatomic, readonly, nullable)   NSString    *tableViewFooterReuseIdentifier;

@end

@interface KMYUIItem (TableView)

@property (nonatomic, readonly, nullable)   NSString    *tableViewCellReuseIdentifier;

@end

NS_ASSUME_NONNULL_END