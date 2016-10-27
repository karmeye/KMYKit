//
//  NSError+KMY.h
//  KMYKit
//
//  Created on 28/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const KMYErrorDomain;

typedef NS_ENUM(NSInteger, KMYErrorCode) {
    KMYErrorCodeUnspecified         = -1,
};

@interface NSError (KMY)

+ (instancetype)kmy_errorWithLocalizedDescription:(nullable NSString *)localizedDescription;

+ (instancetype)kmy_errorWithDomain:(NSString *)domain
                               code:(NSInteger)code
               localizedDescription:(nullable NSString *)localizedDescription;

+ (instancetype)kmy_errorWithDomain:(NSString *)domain
                               code:(NSInteger)code
               localizedDescription:(nullable NSString *)localizedDescription
                      failureReason:(nullable NSString *)failureReason
                 recoverySuggestion:(nullable NSString *)recoverySuggestion;

@end

NS_ASSUME_NONNULL_END
