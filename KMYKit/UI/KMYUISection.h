//
//  KMYUISection.h
//  KMYKit
//
//  Created on 28/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMY+Foundation.h"
#import "KMYUIItem.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString * const KMYUISectionKeyHeaderTitle;
extern NSString * const KMYUISectionKeyFooterTitle;

typedef NS_ENUM(NSInteger, KMYUISectionType) {
    KMYUISectionNone = 0
};

@interface KMYUISection : KMYSection

@property (nonatomic, readonly)                 KMYUISectionType    type;

@end

NS_ASSUME_NONNULL_END