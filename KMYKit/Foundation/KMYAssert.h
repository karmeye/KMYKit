//
//  KMYAssert.h
//  KMYKit
//
//  Created on 01/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

// https://mikeash.com/pyblog/friday-qa-2013-05-03-proper-use-of-asserts.html


#define KMYAssert(expression, ...) \
    do { \
        if(!(expression)) { \
            NSLog(@"%@", [NSString stringWithFormat:@"Assertion failure: %s in %s on line %s:%d. %@\n\nStacktrace: %@", #expression, __PRETTY_FUNCTION__, __FILE__, __LINE__, [NSString stringWithFormat: @"" __VA_ARGS__], [NSThread callStackSymbols]]); \
            abort(); \
        } \
    } while(0)

#define KMYAssertFail(...) \
    do { \
        NSLog(@"%@", [NSString stringWithFormat:@"Assertion failure: %@ in %s on line %s:%d.\n\nStacktrace: %@", [NSString stringWithFormat: @"" __VA_ARGS__], __PRETTY_FUNCTION__, __FILE__, __LINE__, [NSThread callStackSymbols]]); \
        abort(); \
    } while(0)

#define KMYAssertMainThread() \
    KMYAssert([NSThread isMainThread], @"This method must be called from main thread!\n\nStacktrace: %@", [NSThread callStackSymbols])

#define KMYAssertNotMainThread() \
    KMYAssert(![NSThread isMainThread], @"This method must not be called from main thread!\n\nStacktrace: %@", [NSThread callStackSymbols])

#define KMYAssertNotDeallocated() \
    KMYAssert(self, @"An instance expected to exist was deallocated.\n\nStacktrace: %@", [NSThread callStackSymbols]);


// Debug versions:
#if DEBUG
    #define KMYAssertDebug                  KMYAssert
    #define KMYAssertDebugFail              KMYAssertFail
    #define KMYAssertDebugNotDeallocated    KMYAssertNotDeallocated
#else
    #define KMYAssertDebug(...)
    #define KMYAssertDebugFail(...)
    #define KMYAssertDebugNotDeallocated(...)
#endif