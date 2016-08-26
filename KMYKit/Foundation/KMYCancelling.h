//
//  KMYCancelling.h
//  KMYKit
//
//  Created on 26/08/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KMYCancelling <NSObject>

@required

@property (readonly, getter=isCancelled) BOOL cancelled;

- (void)cancel;

@end
