//
//  UITextField+KMY.h
//  KMYKit
//
//  Created on 2017-09-28.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (KMY)

+ (instancetype)kmy_textFieldWithInitializer:(void (^)(__kindof UITextField *textField))initializer NS_SWIFT_NAME(init(initializer:));
+ (instancetype)kmy_textFieldWithFrame:(CGRect)frame initializer:(void (^)(__kindof UITextField *textField))initializer NS_SWIFT_NAME(init(frame:initializer:));

@end

NS_ASSUME_NONNULL_END
