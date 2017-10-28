//
//  KMYAssert.swift
//  KMYKit
//
//  Created on 2017-10-28.
//  Copyright © 2017 Karmeye. All rights reserved.
//

import Foundation

/// Uses `dispatchPrecondition(condition:)` to check if the current context is on the main queue.
/// Falls back to `assert(kmyDispatchIsMainQueue())` if `dispatchPrecondition(condition:)` is not available.
/// - Remark: `dispatchPrecondition(condition:)` will stop program execution in release builds, whereas `assert` will not.
public func kmyDispatchPreconditionOnMainQueue() {
    if #available(iOS 10.0, *) {
        dispatchPrecondition(condition: .onQueue(DispatchQueue.main))
    } else {
        assert(kmyDispatchIsMainQueue())
    }
}

/// Uses `dispatchPrecondition(condition:)` to check if the current context is not on the main queue.
/// Falls back to `assert(kmyDispatchIsMainQueue())` if `dispatchPrecondition(condition:)` is not available.
/// - Remark: `dispatchPrecondition(condition:)` will stop program execution in release builds, whereas `assert` will not.
public func kmyDispatchPreconditionNotOnMainQueue() {
    if #available(iOS 10.0, *) {
        dispatchPrecondition(condition: .notOnQueue(DispatchQueue.main))
    } else {
        assert(!kmyDispatchIsMainQueue())
    }
}
