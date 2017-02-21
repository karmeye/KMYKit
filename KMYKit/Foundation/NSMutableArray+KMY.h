//
//  NSMutableArray+KMY.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray<ObjectType>  (KMY)

- (void)kmy_addObjectIfSet:(nullable ObjectType)object;

@end

NS_ASSUME_NONNULL_END
