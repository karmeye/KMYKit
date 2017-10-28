//
//  NSAttributedString+KMY.h
//  KMYKit
//
//  Created on 09/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (KMY)

+ (instancetype)kmy_stringWithInitializer:(void (^_Nullable)(NSMutableAttributedString *string))initializer NS_SWIFT_NAME(init(initializer:));

@end

NS_ASSUME_NONNULL_END
