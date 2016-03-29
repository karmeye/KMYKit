//
//  KMYDispatch.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Submits a block for asynchronous execution on a main dispatch queue and returns immediately.
/// The main dispatch queue is a globally available serial queue that executes tasks on the application’s main thread.
extern void                 kmy_dispatch_async_on_main_queue(dispatch_block_t block);
/// Submits a block for asynchronous execution on a main dispatch queue after a delay in seconds and returns immediately.
extern void                 kmy_dispatch_async_on_main_queue_after(NSTimeInterval delay, dispatch_block_t block);
/// Submits a block for asynchronous execution on the default priority dispatch queue and returns immediately.
extern void                 kmy_dispatch_async_on_default_priority_queue(dispatch_block_t block);
/// Submits a block for asynchronous execution on the high priority dispatch queue and returns immediately.
extern void                 kmy_dispatch_async_on_high_priority_queue(dispatch_block_t block);
/// Submits a block for asynchronous execution on the low priority dispatch queue and returns immediately.
extern void                 kmy_dispatch_async_on_low_priority_queue(dispatch_block_t block);
/// Submits a block for asynchronous execution on the background priority dispatch queue and returns immediately.
extern void                 kmy_dispatch_async_on_background_priority_queue(dispatch_block_t block);

/// Returns the serial dispatch queue associated with the application’s main thread.
#define                     kmy_dispatch_get_main_queue() dispatch_get_main_queue()
/// Returns the concurrent global default priority queue, DISPATCH_QUEUE_PRIORITY_DEFAULT.
extern dispatch_queue_t     kmy_dispatch_get_default_priority_queue(void);
/// Returns the concurrent global high priority queue, DISPATCH_QUEUE_PRIORITY_HIGH.
extern dispatch_queue_t     kmy_dispatch_get_high_priority_queue(void);
/// Returns the concurrent global low priority queue, DISPATCH_QUEUE_PRIORITY_LOW.
extern dispatch_queue_t     kmy_dispatch_get_low_priority_queue(void);
/// Returns the concurrent global background priority queue, DISPATCH_QUEUE_PRIORITY_BACKGROUND.
extern dispatch_queue_t     kmy_dispatch_get_background_priority_queue(void);

NS_ASSUME_NONNULL_END