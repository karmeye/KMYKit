//
//  KMYDestructiveButtonTableViewCell.h
//  KMYKit
//
//  Created on 12/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <KMYKit/KMYButtonTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMYDestructiveButtonTableViewCell : KMYButtonTableViewCell

@property (nonatomic, copy, nullable)       UIColor     *destructiveColor UI_APPEARANCE_SELECTOR;

@end

NS_ASSUME_NONNULL_END