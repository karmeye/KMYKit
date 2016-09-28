//
//  KMYCGGeometry.m
//  KMYKit
//
//  Created on 2016-09-23.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYCGGeometry.h"

bool KMYCGSizeIsSet(CGSize size) {
    return !CGSizeEqualToSize(CGSizeZero, size);
}

bool KMYCGSizeIsZero(CGSize size) {
    return CGSizeEqualToSize(CGSizeZero, size);
}

bool KMYCGSizeIsGreaterThan(CGSize size, CGSize largerThanSize) {
    return size.width > largerThanSize.width && size.height > largerThanSize.height;
}

bool KMYCGSizeIsLessThan(CGSize size, CGSize lessThanSize) {
    return size.width < lessThanSize.width && size.height < lessThanSize.height;
}

bool KMYCGSizeIsSetAndLargerThan(CGSize size, CGSize largerThanSize) {
    return KMYCGSizeIsSet(size) && (size.width > largerThanSize.width && size.height > largerThanSize.height);
}

bool KMYCGSizeIsSetAndLessThan(CGSize size, CGSize lessThanSize) {
    return KMYCGSizeIsSet(size) && (size.width < lessThanSize.width && size.height < lessThanSize.height);
}
