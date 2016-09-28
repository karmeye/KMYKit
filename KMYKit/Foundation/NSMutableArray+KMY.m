//
//  NSMutableArray+KMY.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "NSMutableArray+KMY.h"

@implementation NSMutableArray (KMY)

- (void)kmy_addObjectIfSet:(id)object {
    if (object) {
        [self addObject:object];
    }
}

@end
