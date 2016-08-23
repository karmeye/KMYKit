//
//  KMYSerialOperationQueue.m
//  KMYKit
//
//  Created on 22/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYSerialOperationQueue.h"
#import "KMYAssert.h"

@implementation KMYSerialOperationQueue

+ (instancetype)queue {
    return [[[self class] alloc] init];
}

- (instancetype)init {
    self = [super init];
    self.maxConcurrentOperationCount = 1;
    return self;
}

- (NSInteger)maxConcurrentOperationCount {
    return 1;
}

- (void)setMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount {
    KMYAssert(maxConcurrentOperationCount == 1);
    [super setMaxConcurrentOperationCount:1];
}

@end
