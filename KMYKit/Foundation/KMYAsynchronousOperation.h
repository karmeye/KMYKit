//
//  KMYAsynchronousOperation.h
//  KMYKit
//
//  Created on 22/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^KMYAsynchronousOperationExecutionBlock)();

@interface KMYAsynchronousOperation : NSOperation

- (instancetype)init;
- (instancetype)initWithExecutionBlock:(KMYAsynchronousOperationExecutionBlock)executionBlock;

@end

@interface KMYAsynchronousOperation (Subclassing)

/// @brief Sets @c isFinished to @c YES and @c isExecuting to @c NO.
/// @attention Must be called after the operation completed or was cancelled.
- (void)setOperationComplete;

/// Will be called if no @c executionBlock was set.
- (void)execute;

@end