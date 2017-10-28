//
//  NSURL+KMY.h
//  KMYKit
//
//  Created on 05/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (KMY)

+ (nullable instancetype)kmy_ensuredAbsoluteURLWithString:(NSString *)stringRepresentation relativeToFallbackURL:(NSURL *)fallbackBaseURL NS_SWIFT_NAME(init(absoluteURLWithString:relativeToFallbackURL:));

@end

NS_ASSUME_NONNULL_END
