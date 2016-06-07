//
//  KMYTextFieldTableViewCell.h
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KMYKit/KMY+Foundation.h>
#import <KMYKit/KMYDefaultReusableIdentifying.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYTextFieldTableViewCell : UITableViewCell <KMYDefaultReusableIdentifying>

@property (nonatomic, strong, readonly)     UITextField     *textField;

@end

NS_ASSUME_NONNULL_END