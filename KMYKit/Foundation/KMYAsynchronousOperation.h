//
//  KMYAsynchronousOperation.h
//  KMYKit
//
//  Created on 22/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KMYKit/KMYCancelling.h>

NS_ASSUME_NONNULL_BEGIN

typedef id _Nullable    (^KMYAsynchronousOperationSynchronousExecutionBlock)(id<KMYCancelling> cancellingHandler);

/// Call this handler when asynchronous work is done and optionally provide a result which will be provided to the @c KMYAsynchronousOperationResultBlock.
/// @attention Must always be called, even if the operation was cancelled. Subclasses, however, call @c setOperationComplete or @c setOperationCompleteWithResult: instead.
typedef void            (^KMYAsynchronousOperationCompetionHandler)(id _Nullable result);

/// @attention The @c completionHandler must always be called, even if the operation was cancelled, i.e., @c cancellingHandler.isCancelled returned @c YES.
typedef void            (^KMYAsynchronousOperationAsynchronousExecutionBlock)(id<KMYCancelling> cancellingHandler, KMYAsynchronousOperationCompetionHandler completionHandler);

/// Will be called on the given @c resultCallbackQueue with the result value provided in the @c KMYAsynchronousOperationCompetionHandler call.
typedef void            (^KMYAsynchronousOperationResultBlock)(id _Nullable result, BOOL cancelled);

@interface KMYAsynchronousOperation : NSOperation <KMYCancelling>

- (instancetype)initWithSynchronousExecutionBlock:(KMYAsynchronousOperationSynchronousExecutionBlock)executionBlock;

- (instancetype)initWithSynchronousExecutionBlock:(KMYAsynchronousOperationSynchronousExecutionBlock)executionBlock
                                      resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
                              resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue;

- (instancetype)initWithAsynchronousExecutionBlock:(KMYAsynchronousOperationAsynchronousExecutionBlock)executionBlock;

- (instancetype)initWithAsynchronousExecutionBlock:(KMYAsynchronousOperationAsynchronousExecutionBlock)executionBlock
                                       resultBlock:(KMYAsynchronousOperationResultBlock)resultBlock
                               resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue;

@end

/// Normally when implementing a concurrent operation you override the @c start method.
/// This class does that for you so you should not override the @c start methid. Instead,
/// if you decide to subclass this method instead of using the available handlers/blocks,
/// you should override the @c execute method.
@interface KMYAsynchronousOperation (Subclassing)

- (instancetype)init;

- (void)setResultBlock:(KMYAsynchronousOperationResultBlock)resultBlock resultCallbackQueue:(nullable dispatch_queue_t)resultCallbackQueue;

/// @brief Sets @c isFinished to @c YES and @c isExecuting to @c NO.
/// @attention This method or `setOperationCompleteWithResult:` must be called after the operation completed or was cancelled.
- (void)setOperationComplete;

/// @brief Executes the `resultBlock`, if set, on the `resultCallbackQueue`, then sets @c isFinished to @c YES and @c isExecuting to @c NO.
/// @attention This method or `setOperationComplete` must be called after the operation completed or was cancelled.
- (void)setOperationCompleteWithResult:(nullable id)result;

/// Will be called if no execution block was set.
/// The receiver will not check if it has been cancelled before calling this method, so the first thing to do when overriding this method is to check whether the operation was cancelled before implementing any logic.
- (void)execute;

@end

NS_ASSUME_NONNULL_END
