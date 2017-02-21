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

typedef void            (^KMYAsynchronousOperationCompetionHandler)(id _Nullable);
typedef void            (^KMYAsynchronousOperationAsynchronousExecutionBlock)(id<KMYCancelling> cancellingHandler, KMYAsynchronousOperationCompetionHandler completionHandler);

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
- (void)execute;

@end

NS_ASSUME_NONNULL_END
