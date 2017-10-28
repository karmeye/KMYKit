//
//  NSManagedObjectContext+KMY.h
//  KMYKit
//
//  Created on 2017-01-19.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObjectContext (KMY)

/**
 The documentation of @c save: states that @c hasChanges should be called before
 calling @c save: or Core Data may perform unnecessary work. This method does that.

 @param error The pointer to an error object that is passed to the @c save: method of the receiver.
 @return @c YES if save succeeds or if there are no changes to save. NO if save failes and @c error is set.
 */
- (BOOL)kmy_save:(NSError * _Nullable *)error NS_SWIFT_NAME(kmySave());

@end

NS_ASSUME_NONNULL_END
