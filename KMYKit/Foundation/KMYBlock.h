//
//  KMYBlock.h
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

///
/// See Checking For Null Blocks: http://nshipster.com/new-years-2016/
///
#define KMYInvokeBlockIfSet(block, ...) if (block) { block(__VA_ARGS__); };