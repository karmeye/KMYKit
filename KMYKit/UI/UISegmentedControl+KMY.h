//
//  UISegmentedControl+KMY.h
//  KMYKit
//
//  Created on 03/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISegmentedControl (KMY)

@property (nonatomic, copy, nullable)   void (^kmy_valueDidChangeHandler)(__kindof UISegmentedControl *segmentedControl);

+ (instancetype)kmy_segmentedControlWithWithItems:(nullable NSArray *)items initializer:(void (^_Nullable)(__kindof UISegmentedControl *segmentedControl))initializer;

- (void)kmy_insertSegmentsWithTitles:(NSArray <NSString *> *)segmentTitles animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END