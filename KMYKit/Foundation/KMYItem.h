//
//  KMYItem.h
//  KMYKit
//
//  Created on 28/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KMYItemAttributes.h"

NS_ASSUME_NONNULL_BEGIN

// Keys can be used in @c KMYSection as well.

/// Additional info
extern NSString *const KMYItemKeyValue;
/// One of @c KMYSectionItemType or subclass extended type.
extern NSString *const KMYItemKeyType;
/// An identifier, if needed.
extern NSString *const KMYItemKeyID;

@interface KMYItem : NSObject <KMYItemAttributes>

@property (nonatomic, readonly, nullable)           id                value;
@property (nonatomic, readonly, nullable)           NSString          *identifier;

+ (__kindof KMYItem *)itemWithAttributes:(nullable NSDictionary *)dictionary;

/// @discussion Keys are copied; values are retained.
/// @return A copy of the reciver with added attributes and/or possibly overridden.
- (__kindof KMYItem *)copyWithAttributes:(NSDictionary *)dictionary;

@end

@interface KMYItem (Subclassing)

@property (nonatomic, strong, readonly, nullable)   NSDictionary        *attributeDictionary;

@end

NS_ASSUME_NONNULL_END