//
//  KMYSubtitleStyleTableViewCell.h
//  KMYKit
//
//  Created on 01/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMY+Foundation.h"
#import "KMYDefaultReusableIdentifying.h"

NS_ASSUME_NONNULL_BEGIN

/// UITableViewCell using the style UITableViewCellStyleSubtitle that can be used with UITableView registerClass:forCellReuseIdentifier:
@interface KMYSubtitleStyleTableViewCell : UITableViewCell <KMYDefaultReusableIdentifying>
@end

NS_ASSUME_NONNULL_END

