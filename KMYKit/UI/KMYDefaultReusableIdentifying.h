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
@property (class, strong, readonly)     NSString    *defaultReuseIdentifier;

@end

// Returns the class name as a string. Implement as: 
//
// + (NSString *)defaultReuseIdentifier {
//     return KMYDefaultReuseIdentifier();
// }
#define KMYDefaultReuseIdentifier() \
    ({ \
        static NSString *defaultReuseIdentifier; \
        static dispatch_once_t onceToken; \
        dispatch_once(&onceToken, ^{ \
            defaultReuseIdentifier = NSStringFromClass([self class]); \
        }); \
        defaultReuseIdentifier; \
    })

NS_ASSUME_NONNULL_END
