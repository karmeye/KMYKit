//
//  NSError+KMY.m
//  KMYKit
//
//  Created on 28/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSError+KMY.h"
#import "NSString+KMY.h"
#import "NSDictionary+KMY.h"

NSString * const KMYErrorDomain = @"KMYErrorDomain";

@implementation NSError (KMY)

+ (instancetype)kmy_errorWithLocalizedDescription:(nullable NSString *)localizedDescription {
    return [[self class] kmy_errorWithDomain:KMYErrorDomain code:KMYErrorCodeUnspecified localizedDescription:localizedDescription failureReason:nil recoverySuggestion:nil];
}

+ (instancetype)kmy_errorWithDomain:(NSString *)domain
                               code:(NSInteger)code
               localizedDescription:(NSString *)localizedDescription {
    return [[self class] kmy_errorWithDomain:domain code:code localizedDescription:localizedDescription failureReason:nil recoverySuggestion:nil];
}

+ (instancetype)kmy_errorWithDomain:(NSString *)domain
                               code:(NSInteger)code
               localizedDescription:(NSString *)localizedDescription
                      failureReason:(NSString *)failureReason
                 recoverySuggestion:(NSString *)recoverySuggestion {
    return [[self class] errorWithDomain:domain
                                    code:code
                                userInfo:[NSDictionary kmy_dictionaryWithInitializer:^(NSMutableDictionary * _Nonnull userInfo) {
        if (KMYStringContainsVisibleCharacters(localizedDescription))   userInfo[NSLocalizedDescriptionKey]             = localizedDescription;
        if (KMYStringContainsVisibleCharacters(failureReason))          userInfo[NSLocalizedFailureReasonErrorKey]      = failureReason;
        if (KMYStringContainsVisibleCharacters(recoverySuggestion))     userInfo[NSLocalizedRecoverySuggestionErrorKey] = recoverySuggestion;
    }]];
}


@end
