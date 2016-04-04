//
//  KMYTableViewDelegate.h
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMY+Foundation.h"
#import "KMYUISection.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMYTableViewDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, weak, readwrite, nullable)    id<KMYSectionProvider>      sectionProvider;

- (instancetype)initWithSectionProvider:(id<KMYSectionProvider>)sectionProvider;

@end

NS_ASSUME_NONNULL_END