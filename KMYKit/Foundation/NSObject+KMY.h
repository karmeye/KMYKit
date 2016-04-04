//
//  NSObject+KMY.h
//  KMYKit
//
//  Created on 24/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (KMY)

/// Calls init. Supports subclasses.
///
/// @param initializer Use to customize the newly allocated instance.
///
/// @return A new NSObject instance.
+ (nullable instancetype)kmy_initWithInitializer:(void (^)(id object))initializer;

@end

NS_ASSUME_NONNULL_END