//
//  KMYBlock.h
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

@import Foundation;
#import <KMYKit/KMYDispatch.h>
#import <KMYKit/KMYAssert.h>

///
/// See Checking For Null Blocks: http://nshipster.com/new-years-2016/
///
#define KMYInvokeBlockIfSet(block, ...)                             if (block) { block(__VA_ARGS__); };


#define KMYInvokeBlockAsyncOnQueueIfSet(queue, block, ...)          if (block) { KMYAssert(queue != NULL); dispatch_async(queue, ^{ block(__VA_ARGS__); }); };
#define KMYInvokeBlockAsyncOnMainQueueIfSet(block, ...)             if (block) { dispatch_async(dispatch_get_main_queue(), ^{ block(__VA_ARGS__); }); };
