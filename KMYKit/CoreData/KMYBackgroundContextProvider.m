//
//  KMYBackgroundContextProvider.m
//  KMYKit
//
//  Created on 2017-11-26.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import "KMYBackgroundContextProvider.h"

@implementation KMYBackgroundContextProvider {
    NSPersistentContainer * _container;
}

+ (instancetype)backgroundContextProviderWithPersistentContainer:(NSPersistentContainer *)container {
    KMYBackgroundContextProvider *provider = [[[self class] alloc] init];
    provider->_container = container;
    return provider;
}

#pragma mark - KMYBackgroundContextProviding protocol

- (nonnull NSManagedObjectContext *)newBackgroundContext {
    return [self->_container newBackgroundContext];
}

@end
