//
//  KMYItemAttributes.h
//  KMYKit
//
//  Created on 28/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KMYItemAttributes <NSObject>

/// @brief An array containing the attribute keys for the item’s values or an empty array if the item has no attributes.
/// @discussion This property contains an array of attribute keys, representing the values available from this item.
@property (readonly, copy)      NSArray     *attributes;

/// Returns the receiver’s metadata attribute name specified by a given key.
///
/// @param key The name of an attribute.
///
/// @return The receiver’s attribute value specified by key.
- (nullable id)valueForAttribute:(NSString *)key;

/// Returns a dictionary containing the key-value pairs for the attribute names specified by a given array of keys.
///
/// @param keys An array containing NSString objects that specify the names of a metadata attributes. See the “Constants” section for a list of possible keys.
///
/// @return A dictionary containing the key-value pairs for the attribute names specified by keys.
- (NSDictionary *)valuesForAttributes:(NSArray *)keys;

@end

NS_ASSUME_NONNULL_END