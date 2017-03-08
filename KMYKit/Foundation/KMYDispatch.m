//
//  KMYDispatch.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYDispatch.h"

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


dispatch_queue_t kmy_dispatch_get_user_interactive_queue(void) {
    return dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
}

dispatch_queue_t kmy_dispatch_get_user_initiated_queue(void) {
    return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
}

dispatch_queue_t kmy_dispatch_get_default_queue(void) {
    return dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
}

dispatch_queue_t kmy_dispatch_get_utility_queue(void) {
    return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
}

dispatch_queue_t kmy_dispatch_get_background_queue(void) {
    return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
}

#pragma mark -

void kmy_dispatch_async_on_main_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_main_queue(), block);
}

void kmy_dispatch_sync_on_main_queue(dispatch_block_t block) {
    if (kmy_dispatch_is_main_queue()) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void kmy_dispatch_async_on_user_interactive_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_user_interactive_queue(), block);
}

void kmy_dispatch_async_on_user_initiated_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_user_initiated_queue(), block);
}

void kmy_dispatch_async_on_default_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_default_queue(), block);
}

void kmy_dispatch_async_on_utility_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_utility_queue(), block);
}

void kmy_dispatch_async_on_background_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_background_queue(), block);
}

void kmy_dispatch_async_on_default_priority_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_default_queue(), block);
}

void kmy_dispatch_async_on_high_priority_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_user_initiated_queue(), block);
}

void kmy_dispatch_async_on_low_priority_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_utility_queue(), block);
}

void kmy_dispatch_async_on_background_priority_queue(dispatch_block_t block) {
    dispatch_async(kmy_dispatch_get_background_queue(), block);
}

void kmy_dispatch_async_on_main_queue_after(NSTimeInterval delay, dispatch_block_t block) {
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), kmy_dispatch_get_main_queue(), block);
}

void kmy_dispatch_async_on_queue_after(dispatch_queue_t queue, NSTimeInterval delay, dispatch_block_t block) {
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), queue, block);
}

void kmy_dispatch_async_if(dispatch_queue_t queue, dispatch_block_t block) {
    if (queue)  dispatch_async(queue, block);
    else        block();
}

#pragma mark -

bool kmy_dispatch_is_main_queue() {

    static const void *const mainQueueKey;
    static const void *mainQueueValue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_queue_set_specific(dispatch_get_main_queue(), &mainQueueKey, &mainQueueValue, NULL);
    });

    return dispatch_get_specific(&mainQueueKey) == &mainQueueValue;
}


























