//
//  KMYCollectionViewDataSource.h
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMYUISection.h>
#import <KMYKit/KMYCollectionViewCellConfigurator.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property (nonatomic, weak, readwrite, nullable)        id<KMYSectionProvider>                  sectionProvider;
@property (nonatomic, strong, readwrite, nullable)      id<KMYCollectionViewCellConfigurating>  cellConfigurator;

- (instancetype)initWithSectionProvider:(nullable id<KMYSectionProvider>)sectionProvider;
- (instancetype)initWithSectionProvider:(nullable id<KMYSectionProvider>)sectionProvider cellConfigurator:(nullable id<KMYCollectionViewCellConfigurating>)cellConfigurator;

@end

NS_ASSUME_NONNULL_END