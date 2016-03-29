//
//  NSArray+KMY.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (KMY)

+ (nullable instancetype)kmy_initWithInitializer:(void (^)(NSMutableArray *array))initializer;

@end

NS_ASSUME_NONNULL_END