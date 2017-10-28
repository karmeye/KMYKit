//
//  NSArray+KMY.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (KMY)

+ (nullable instancetype)kmy_arrayWithInitializer:(void (^_Nullable)(NSMutableArray *array))initializer NS_SWIFT_NAME(init(initializer:));

/// @return The object at the specified index or nil if index is out of bounds.
- (nullable id)kmy_objectAtIndexOrNil:(NSUInteger)index NS_SWIFT_NAME(kmyObject(at:));

@end

NS_ASSUME_NONNULL_END
