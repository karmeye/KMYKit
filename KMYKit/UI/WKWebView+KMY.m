//
//  WKWebView+KMY.m
//  KMYKit
//
//  Created on 26/05/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "WKWebView+KMY.h"
#import <KMYKit/KMY+Foundation.h>

@implementation WKWebView (KMY)

+ (instancetype)kmy_viewWithInitializer:(void (^)(__kindof WKWebView *view))initializer configurationInitializer:(void (^)(WKWebViewConfiguration *configuration))configurationInitializer {
    WKWebViewConfiguration *configuration = [WKWebViewConfiguration kmy_objectWithInitializer:configurationInitializer];
    WKWebView *view = [[[self class] alloc] initWithFrame:CGRectZero configuration:configuration];
    if (view && initializer != NULL) initializer(view);
    return view;
}

@end
