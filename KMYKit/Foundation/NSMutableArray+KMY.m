//
//  NSMutableArray+KMY.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSMutableArray+KMY.h"

@implementation NSMutableArray (KMY)

- (void)kmy_addObjectIfSet:(nullable id)object {
    if (object) {
        [self addObject:object];
    }
}

- (void)kmy_addObjectsFromArrayIfSet:(nullable NSArray *)array {
    if (array) {
        [self addObjectsFromArray:array];
    }
}

@end
