//
//  KMYMacros.h
//  KMYKit
//
//  Created on 05/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#define KMY_WEAK(instance, variableName)        typeof(instance) __weak variableName = instance
#define KMY_STRONG(instance, variableName)      typeof(instance) __strong variableName = instance

// Class, Type
//
#define KMYClass()                              [self class]
#define KMYCast(inst, type)                     ((type)inst)
#define KMYCastIfKindOfClass(inst, className)   ([inst isKindOfClass:[className class]] ? (className*)inst : nil)
#define KMYCastIfConformsToProtocol(inst, prot) ([inst conformsToProtocol:@protocol(prot)] ? (id<prot>)inst : nil)

// Nil, NSNull
//
#define KMY_SET_IF_NIL(var, value)              if (!var) { var = value; }
#define KMYIsNSNull(var)                        (var == (id)[NSNull null])
#define KMYIsNilOrNSNull(var)                   (var == nil || var == (id)[NSNull null])
#define KMY_ENSURE_NIL_IF_NSNULL(var)           (var = (KMYIsNilOrNSNull(var) ? nil : var))

// Collections
#define KMYArrayContainsObjects(array)              (array && array.count > 0)
#define KMYArrayIsNilOrEmpty(array)                 (array == nil || array.count == 0)
#define KMYDictionaryContainsObjects(dictionary)    (dictionary && dictionary.count > 0)
#define KMYSetIsNilOrEmpty(set)                     (set == nil || set.count == 0)
#define KMYSetContainsObjects(set)                  (set && set.count > 0)

#if defined(DEBUG)
#define KMYIfDebugBuild(block)                  block()
#else
#define KMYIfDebugBuild(...)
#endif

#if TARGET_OS_SIMULATOR
#define KMYIfSimulator(block)                   block()
#else
#define KMYIfSimulator(...)
#endif


#define KMY_DEPRECATED(msg)                     __attribute__((deprecated("Deprecated in KMYKit: " msg)))
