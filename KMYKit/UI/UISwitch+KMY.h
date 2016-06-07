//
//  UISwitch+KMY.h
//  KMYKit
//
//  Created on 03/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISwitch (KMY)

@property (nonatomic, copy, nullable)   void (^kmy_valueDidChangeHandler)(__kindof UISwitch *switchControl);

@end

NS_ASSUME_NONNULL_END