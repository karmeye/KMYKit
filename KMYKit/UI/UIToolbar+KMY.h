//
//  UIToolbar+KMY.h
//  KMYKit
//
//  Created on 2017-02-03.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIToolbar (KMY)

/// Creates a @c UIToolbar and returns the height of its bounds after having called @c sizeToFit. The result is cached.
@property (class, nonatomic, assign, readonly)      CGFloat     kmy_defaultHeight NS_SWIFT_NAME(kmyDefaultHeight);

@end

NS_ASSUME_NONNULL_END
