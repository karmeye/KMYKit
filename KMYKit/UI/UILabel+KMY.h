//
//  UILabel+KMY.h
//  KMYKit
//
//  Created on 2017-09-28.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (KMY)

+ (instancetype)kmy_labelWithInitializer:(void (^)(__kindof UILabel *label))initializer NS_SWIFT_NAME(init(initializer:));
+ (instancetype)kmy_labelWithFrame:(CGRect)frame initializer:(void (^)(__kindof UILabel *label))initializer NS_SWIFT_NAME(init(frame:initializer:));

@end

NS_ASSUME_NONNULL_END
