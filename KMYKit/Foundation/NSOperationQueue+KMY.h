//
//  NSOperationQueue+KMY.h
//  KMYKit
//
//  Created on 2017-10-26.
//  Copyright © 2017 Karmeye. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSOperationQueue (KMY)

- (__kindof NSOperation *)kmy_addOperation:(__kindof NSOperation *)operation NS_SWIFT_NAME(kmyAddOperation(_:));

@end

NS_ASSUME_NONNULL_END
