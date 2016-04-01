//
//  KMYAssert.h
//  KMYKit
//
//  Created by on 01/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

//
//
// Following assertions use techniques presented here: https://mikeash.com/pyblog/friday-qa-2013-05-03-proper-use-of-asserts.html
//
//

// Will assert by default in XCode release builds. Setting the NDEBUG disables it.
#define KMYAssert(expression, ...) \
    do { \
        if(!(expression)) { \
            NSLog(@"%@", [NSString stringWithFormat:@"Assertion failure: %s in %s on line %s:%d. %@", #expression, __PRETTY_FUNCTION__, __FILE__, __LINE__, [NSString stringWithFormat: @"" __VA_ARGS__]]); \
            abort(); \
        } \
    } while(0)

// Always failes, i.e. there’s no expression.
// Will assert by default in XCode release builds. Setting the NDEBUG disables it.
#define KMYAssertFail(...) \
    do { \
        NSLog(@"%@", [NSString stringWithFormat:@"Assertion failure: %@ in %s on line %s:%d.", [NSString stringWithFormat: @"" __VA_ARGS__], __PRETTY_FUNCTION__, __FILE__, __LINE__]); \
        abort(); \
    } while(0)

//
//
// Following macros are only effected when DEBUG is set (which is the default in Xcode).
//
//
#if DEBUG
    #define KMYAssertDebug              KMYAssert
    #define KMYAssertDebugFail          KMYAssertFail
#else
    #define KMYAssertDebug(...)
    #define KMYAssertDebugFail(...)
#endif