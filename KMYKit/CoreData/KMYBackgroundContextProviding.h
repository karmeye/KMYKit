//
//  KMYBackgroundContextProviding.h
//  KMYKit
//
//  Created on 2017-11-26.
//  Copyright © 2017 Karmeye. All rights reserved.
//

@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@protocol KMYBackgroundContextProviding <NSObject>

@required

- (NSManagedObjectContext *)newBackgroundContext;

@end

NS_ASSUME_NONNULL_END
