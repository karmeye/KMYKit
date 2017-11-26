//
//  KMYBackgroundContextProvider.h
//  KMYKit
//
//  Created on 2017-11-26.
//  Copyright © 2017 Karmeye. All rights reserved.
//

@import Foundation;
@import CoreData;

#import <KMYKit/KMYBackgroundContextProviding.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYBackgroundContextProvider : NSObject<KMYBackgroundContextProviding>

/// The passed container will be retained by the receiver.
+ (instancetype)backgroundContextProviderWithPersistentContainer:(NSPersistentContainer *)container;

@end

NS_ASSUME_NONNULL_END
