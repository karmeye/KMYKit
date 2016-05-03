//
//  KMYDefaultCollectionViewCell.h
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMYDefaultReusableIdentifying.h>
#import <KMYKit/KMY+Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYDefaultCollectionViewCell : UICollectionViewCell <KMYDefaultReusableIdentifying>

@property (nonatomic, strong, readonly, nullable)   UILabel         *textLabel;
@property (nonatomic, strong, readonly, nullable)   UILabel         *detailTextLabel;
@property (nonatomic, strong, readonly, nullable)   UIImageView     *imageView;

@end

NS_ASSUME_NONNULL_END