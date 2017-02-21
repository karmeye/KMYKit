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

/// Calls alloc then init and subsequently invoces the initializer block passing the newly allocated instance. Supports subclasses.
///
/// @param initializer Use to customize the newly allocated instance.
///
/// @return A new NSObject instance, or a subclass.
+ (instancetype)kmy_objectWithInitializer:(void (^_Nullable)(__kindof NSObject *object))initializer NS_SWIFT_NAME(init(initializer:));

@end

NS_ASSUME_NONNULL_END
