//
//  KMYCollectionViewDelegate.h
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMYUISection.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYCollectionViewDelegate : NSObject <UICollectionViewDelegate>

@property (nonatomic, weak, readwrite, nullable)    id<KMYSectionProvider>      sectionProvider;

- (instancetype)initWithSectionProvider:(id<KMYSectionProvider>)sectionProvider;

@end

NS_ASSUME_NONNULL_END