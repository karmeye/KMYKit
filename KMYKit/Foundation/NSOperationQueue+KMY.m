//
//  NSOperationQueue+KMY.m
//  KMYKit
//
//  Created on 2017-10-26.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import "NSOperationQueue+KMY.h"

@implementation NSOperationQueue (KMY)

- (__kindof NSOperation *)kmy_addOperation:(__kindof NSOperation *)operation {
    [self addOperation:operation];
    return operation;
}

@end
