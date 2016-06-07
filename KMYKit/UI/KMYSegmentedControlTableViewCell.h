//
//  KMYSegmentedControlTableViewCell.h
//  KMYKit
//
//  Created on 03/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <KMYKit/KMY+Foundation.h>
#import <KMYKit/KMYDefaultReusableIdentifying.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYSegmentedControlTableViewCell : UITableViewCell <KMYDefaultReusableIdentifying>

@property (nonatomic, strong, readonly)     UILabel                 *textLabel;
@property (nonatomic, strong, readonly)     UISegmentedControl      *segmentedControl;

@end

NS_ASSUME_NONNULL_END