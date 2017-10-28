//
//  NSDictionary+KMY.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (KMY)

+ (nullable instancetype)kmy_dictionaryWithInitializer:(void (^_Nullable)(NSMutableDictionary *dictionary))initializer NS_SWIFT_NAME(init(initializer:));

/// @return If there is a NSNumber associated with the key, the boolean value of the NSNumber, otherwise NO.
- (BOOL)kmy_boolForKey:(id)key NS_SWIFT_NAME(kmyBool(forKey:));

/// @return The NSNumber associated with the key. Or nil if there is no NSNumber (or subclass) for the key.
- (nullable NSNumber *)kmy_numberForKey:(id)key NS_SWIFT_NAME(kmyNumber(forKey:));

/// @param key          The key
/// @param defaultValue The value to return if there is no NSNumber associated with the key. For example use NSIntegerMax or 0.
/// @return If there is a NSNumber associated with the key, the NSInteger value of the NSNumber, otherwise the defaultValue parameter is returned.
- (NSInteger)kmy_integerForKey:(id)key defaultValue:(NSInteger)defaultValue NS_SWIFT_NAME(kmyInt(forKey:defaultValue:));

/// @param key          The key
/// @param defaultValue The value to return if there is no NSNumber associated with the key. For example use NSUIntegerMax or 0.
/// @return If there is a NSNumber associated with the key, the NSUInteger value of the NSNumber, otherwise the defaultValue parameter is returned.
- (NSUInteger)kmy_unsignedIntegerForKey:(id)key defaultValue:(NSUInteger)defaultValue NS_SWIFT_NAME(kmyUInt(forKey:defaultValue:));

@end

NS_ASSUME_NONNULL_END
