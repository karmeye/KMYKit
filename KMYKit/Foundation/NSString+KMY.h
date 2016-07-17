//
//  NSString+KMY.h
//  KMYKit
//
//  Created on 03/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT   NSString * const KMYEmptyString;

#define KMYStringOrEmpty(str)       ((str) ?: KMYEmptyString)

/// Will trim non-visible characters from the string.
/// @note      Non-visible characters includes space characters, tabs, newlines, carriage returns, and any similar characters that do not have a visible representation.
/// @param     stringToTrim The string to trim.
/// @return    A new trimmed string or nil if given string was nil.
FOUNDATION_EXPORT   NSString    *KMYStringTrimNonVisibleCharacters(NSString *stringToTrim);

/// Determines if a string contains visible characters by trimming non-visible characters and checking if the length of the result is > 0.
///
/// @note       This function is useful to determine if a string is empty.
/// @remarks    Non-visible characters includes space characters, tabs, newlines, carriage returns, and any similar characters that do not have a visible representation.
/// @param      string The string to check.
/// @return     YES if string contains visible characters.
FOUNDATION_EXPORT   BOOL        KMYStringContainsVisibleCharacters(NSString *string);

@interface NSString (KMY)

+ (instancetype)kmy_stringWithInitializer:(void (^_Nullable)(NSMutableString *string))initializer;

@end

NS_ASSUME_NONNULL_END
