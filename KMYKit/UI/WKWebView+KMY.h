//
//  WKWebView+KMY.h
//  KMYKit
//
//  Created on 26/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (KMY)

+ (instancetype)kmy_viewWithInitializer:(void (^_Nullable)(__kindof WKWebView *view))initializer
               configurationInitializer:(void (^_Nullable)(WKWebViewConfiguration *configuration))configurationInitializer NS_SWIFT_NAME(init(initializer:configurationiInitializer:));

@end

NS_ASSUME_NONNULL_END
