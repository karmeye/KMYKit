//
//  KMYDispatch.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

@import Foundation;
#import <KMYKit/KMYMacros.h>

/*
 
 https://developer.apple.com/videos/play/wwdc2014/716/

 # User Interactive

 Is this work actively involved in updating the UI?
 
 UI thread
 Directly involved in 
    Event handling
    UI drawing
 Small fraction of total work
 
 # User Initiated

 Is this work required to continue user interaction?
 
 Asynchronous to UI
 Directly UI-initiated
 User waiting for immediate results 
 Required to continue user interaction
 
 # Default
 
 * No specific QoS information was available
 * Ordered between UI and non-UI QoS
 * Thread and global queue default
 * Not intended as a work classification

 # Utility
 
 Is the user aware of the progress of this work?
 
 Long-running with user-visible progress 
    Computation,I/O,networking
 Ongoing data feed to UI
 Getting ready for next UI request 
 Energy efficient

 # Background
 
 Can this work be deferred to start at a better time?
 
 User is unaware work is occurring 
 Prefetching
 Deferrable
 Maintenance

 */

NS_ASSUME_NONNULL_BEGIN

/// Returns the serial dispatch queue associated with the application’s main thread.
#define                     kmy_dispatch_get_main_queue() dispatch_get_main_queue()

/// Returns the concurrent global default priority queue, DISPATCH_QUEUE_PRIORITY_DEFAULT.
extern dispatch_queue_t     kmy_dispatch_get_default_priority_queue(void) KMY_DEPRECATED();

/// Returns the concurrent global high priority queue, DISPATCH_QUEUE_PRIORITY_HIGH.
extern dispatch_queue_t     kmy_dispatch_get_high_priority_queue(void) KMY_DEPRECATED();

/// Returns the concurrent global low priority queue, DISPATCH_QUEUE_PRIORITY_LOW.
extern dispatch_queue_t     kmy_dispatch_get_low_priority_queue(void) KMY_DEPRECATED();

/// Returns the concurrent global background priority queue, DISPATCH_QUEUE_PRIORITY_BACKGROUND.
extern dispatch_queue_t     kmy_dispatch_get_background_priority_queue(void) KMY_DEPRECATED();


extern dispatch_queue_t     kmy_dispatch_get_user_interactive_queue(void);
extern dispatch_queue_t     kmy_dispatch_get_user_initiated_queue(void);
/// Only use if you have no QoS intent.
extern dispatch_queue_t     kmy_dispatch_get_default_queue(void);
extern dispatch_queue_t     kmy_dispatch_get_utility_queue(void);
extern dispatch_queue_t     kmy_dispatch_get_background_queue(void);


/// Submits a block for asynchronous execution on a main dispatch queue and returns immediately.
/// The main dispatch queue is a globally available serial queue that executes tasks on the application’s main thread.
extern void                 kmy_dispatch_async_on_main_queue(dispatch_block_t block);

extern void                 kmy_dispatch_async_on_user_interactive_queue(dispatch_block_t block);
extern void                 kmy_dispatch_async_on_user_initiated_queue(dispatch_block_t block);
/// Only use if you have no QoS intent.
extern void                 kmy_dispatch_async_on_default_queue(dispatch_block_t block);
extern void                 kmy_dispatch_async_on_utility_queue(dispatch_block_t block);
extern void                 kmy_dispatch_async_on_background_queue(dispatch_block_t block);

/// Submits a block for asynchronous execution on the default priority dispatch queue and returns immediately.
extern void                 kmy_dispatch_async_on_default_priority_queue(dispatch_block_t block) KMY_DEPRECATED();

/// Submits a block for asynchronous execution on the high priority dispatch queue and returns immediately.
extern void                 kmy_dispatch_async_on_high_priority_queue(dispatch_block_t block) KMY_DEPRECATED();

/// Submits a block for asynchronous execution on the low priority dispatch queue and returns immediately.
extern void                 kmy_dispatch_async_on_low_priority_queue(dispatch_block_t block) KMY_DEPRECATED();

/// Submits a block for asynchronous execution on the background priority dispatch queue and returns immediately.
extern void                 kmy_dispatch_async_on_background_priority_queue(dispatch_block_t block) KMY_DEPRECATED();

/// Submits a block for asynchronous execution on a main dispatch queue after a delay in seconds and returns immediately.
extern void                 kmy_dispatch_async_on_main_queue_after(NSTimeInterval delay, dispatch_block_t block);

/// Submits a block for asynchronous execution on the given dispatch queue after a delay in seconds and returns immediately.
extern void                 kmy_dispatch_async_on_queue_after(dispatch_queue_t queue, NSTimeInterval delay, dispatch_block_t block);

extern void                 kmy_dispatch_async_if(dispatch_queue_t _Nullable queue, dispatch_block_t block);


NS_ASSUME_NONNULL_END





















