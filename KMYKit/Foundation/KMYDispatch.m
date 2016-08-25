//
//  KMYDispatch.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYDispatch.h"

void kmy_dispatch_async_on_main_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_main_queue(), block);
}

void kmy_dispatch_async_on_main_queue_after(NSTimeInterval delay, dispatch_block_t block) {
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), kmy_dispatch_get_main_queue(), block);
}

void kmy_dispatch_async_on_queue_after(dispatch_queue_t queue, NSTimeInterval delay, dispatch_block_t block) {
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), queue, block);
}

void kmy_dispatch_async_on_default_priority_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_default_priority_queue(), block);
}

void kmy_dispatch_async_on_high_priority_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_high_priority_queue(), block);
}

void kmy_dispatch_async_on_low_priority_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_low_priority_queue(), block);
}

void kmy_dispatch_async_on_background_priority_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_background_priority_queue(), block);
}

dispatch_queue_t kmy_dispatch_get_default_priority_queue(void) {
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

dispatch_queue_t kmy_dispatch_get_high_priority_queue(void) {
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
}

dispatch_queue_t kmy_dispatch_get_low_priority_queue(void) {
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
}

dispatch_queue_t kmy_dispatch_get_background_priority_queue(void) {
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
}