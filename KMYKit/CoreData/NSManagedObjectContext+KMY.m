//
//  NSManagedObjectContext+KMY.m
//  KMYKit
//
//  Created on 2017-01-19.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import "NSManagedObjectContext+KMY.h"

@implementation NSManagedObjectContext (KMY)

- (BOOL)kmy_save:(NSError * _Nullable *)error {
    BOOL result = YES;
    if (self.hasChanges) {
        result = [self save:error];
    }
    return result;
}

@end
