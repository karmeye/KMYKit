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

typedef void (^KMYAsynchronousOperationSynchronousExecutionBlock)(id<KMYCancelling> cancellingHandler);

typedef void (^KMYAsynchronousOperationCompetionHandler)(void);
typedef void (^KMYAsynchronousOperationAsynchronousExecutionBlock)(id<KMYCancelling> cancellingHandler, KMYAsynchronousOperationCompetionHandler completionHandler);

@interface KMYAsynchronousOperation : NSOperation <KMYCancelling>

- (instancetype)initWithSynchronousExecutionBlock:(KMYAsynchronousOperationSynchronousExecutionBlock)executionBlock;
- (instancetype)initWithAsynchronousExecutionBlock:(KMYAsynchronousOperationAsynchronousExecutionBlock)executionBlock;

@end

@interface KMYAsynchronousOperation (Subclassing)

- (instancetype)init;

/// @brief Sets @c isFinished to @c YES and @c isExecuting to @c NO.
/// @attention Must be called after the operation completed or was cancelled.
- (void)setOperationComplete;

/// Will be called if no execution block was set.
- (void)execute;

@end

NS_ASSUME_NONNULL_END