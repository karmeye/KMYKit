//
//  KMYTableViewDelegate.h
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMY+Foundation.h>
#import <KMYKit/KMYUISection.h>
#import <KMYKit/KMYTableViewHeaderFooterConfigurator.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYTableViewDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, weak, readwrite, nullable)    id<KMYSectionProvider>                      sectionProvider;
@property (nonatomic, strong, readwrite)            id<KMYTableViewHeaderFooterConfigurating>   headerFooterConfigurator;

- (instancetype)initWithSectionProvider:(id<KMYSectionProvider>)sectionProvider;

@end

NS_ASSUME_NONNULL_END