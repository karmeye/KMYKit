//
//  KMYMacros.h
//  KMYKit
//
//  Created on 05/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#define KMY_WEAK(instance, variableName)        typeof(instance) __weak variableName = instance
#define KMY_STRONG(instance, variableName)      typeof(instance) __strong variableName = instance
