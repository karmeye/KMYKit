//
//  KMYDefaultStyleTableViewCell.h
//  KMYKit
//
//  Created on 30/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMY+Foundation.h"
#import "KMYDefaultReusableIdentifying.h"

NS_ASSUME_NONNULL_BEGIN

/// UITableViewCell using the style UITableViewCellStyleDefault that can be used with UITableView registerClass:forCellReuseIdentifier:
@interface KMYDefaultStyleTableViewCell : UITableViewCell <KMYDefaultReusableIdentifying>
@end

NS_ASSUME_NONNULL_END