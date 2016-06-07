//
//  KMYSwitchTableViewCell.h
//  KMYKit
//
//  Created by Karmeye on 03/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMY+Foundation.h>
#import <KMYKit/KMYSubtitleStyleTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYSwitchTableViewCell : KMYSubtitleStyleTableViewCell <KMYDefaultReusableIdentifying>

@property (nonatomic, strong, readonly)     UISwitch        *switchControl;

@end

NS_ASSUME_NONNULL_END