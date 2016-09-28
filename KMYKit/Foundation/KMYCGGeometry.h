//
//  KMYCGGeometry.h
//  KMYKit
//
//  Created on 2016-09-23.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

CG_EXTERN bool KMYCGSizeIsSet(CGSize size);
CG_EXTERN bool KMYCGSizeIsZero(CGSize size);

CG_EXTERN bool KMYCGSizeIsGreaterThan(CGSize size, CGSize largerThanSize);
CG_EXTERN bool KMYCGSizeIsLessThan(CGSize size, CGSize lessThanSize);

CG_EXTERN bool KMYCGSizeIsSetAndLargerThan(CGSize size, CGSize largerThanSize);
CG_EXTERN bool KMYCGSizeIsSetAndLessThan(CGSize size, CGSize lessThanSize);
