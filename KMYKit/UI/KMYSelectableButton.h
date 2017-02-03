//
//  KMYSelectableButton.h
//  KMYKit
//
//  Created on 2017-01-31.
//  Copyright © 2017 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYSelectableButton : UIButton

@property (nonatomic, assign)       CGFloat     cornerRadius UI_APPEARANCE_SELECTOR;

+ (instancetype)button;
+ (instancetype)buttonWithTitle:(nullable NSString *)title;
+ (instancetype)buttonWithBarButtonSystemItem:(UIBarButtonSystemItem)barButtonSystemItem;

@end

@interface KMYSelectableButton (UIBarButtonItemSupport)

+ (instancetype)buttonForBarButtonCustomViewWithTitle:(nullable NSString *)title;
+ (instancetype)buttonForBarButtonCustomViewWithBarButtonSystemItem:(UIBarButtonSystemItem)barButtonSystemItem;

@end

NS_ASSUME_NONNULL_END
