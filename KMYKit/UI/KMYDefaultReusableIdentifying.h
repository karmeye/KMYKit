//
//  KMYDefaultReusableIdentifying.h
//  KMYKit
//
//  Created on 31/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KMYDefaultReusableIdentifying <NSObject>

/// Return a reuse identifier that is unique to the class name. Typically NSStringFromClass([self class])
+ (NSString *)defaultReuseIdentifier;

@end

#define KMYDefaultReuseIdentifier() \
    ({ \
        static NSString *_kmy_defaultReuseIdentifier; \
        static dispatch_once_t onceToken; \
        dispatch_once(&onceToken, ^{ \
            _kmy_defaultReuseIdentifier = NSStringFromClass([self class]); \
        }); \
        _kmy_defaultReuseIdentifier; \
    })

NS_ASSUME_NONNULL_END