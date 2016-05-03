//
//  NSString+KMY.h
//  KMYKit
//
//  Created on 03/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const KMYEmptyString;

#define KMYStringOrEmpty(str)       (str ?: KMYEmptyString)

@interface NSString (KMY)

+ (instancetype)kmy_stringWithInitializer:(void (^_Nullable)(NSMutableString *string))initializer;

@end

NS_ASSUME_NONNULL_END
