//
//  KMYAssert.swift
//  KMYKit
//
//  Created on 2017-10-28.
//  Copyright © 2017 Karmeye. All rights reserved.
//

import Foundation

/// Uses `dispatchPrecondition(condition:)` to check if the current context is on the main queue.
/// Falls back to `assertOnMainQueue()` if `dispatchPrecondition(condition:)` is not available.
/// - Remark: `dispatchPrecondition(condition:)` will stop program execution in release builds, whereas `assert` will not.
public func dispatchPreconditionOnMainQueue() {
    if #available(iOS 10.0, *) {
        dispatchPrecondition(condition: .onQueue(DispatchQueue.main))
    } else {
        assertOnMainQueue()
    }
}

/// Uses `dispatchPrecondition(condition:)` to check if the current context is not on the main queue.
/// Falls back to `assertNotOnMainQueue()` if `dispatchPrecondition(condition:)` is not available.
/// - Remark: `dispatchPrecondition(condition:)` will stop program execution in release builds, whereas `assert` will not.
public func dispatchPreconditionNotOnMainQueue() {
    if #available(iOS 10.0, *) {
        dispatchPrecondition(condition: .notOnQueue(DispatchQueue.main))
    } else {
        assertNotOnMainQueue()
    }
}

public func assertOnMainQueue(file: StaticString = #file, line: UInt = #line) {
    assert(dispatchIsOnMainQueue(), "This must execute on the main queue!", file: file, line: line)
}

public func assertNotOnMainQueue(file: StaticString = #file, line: UInt = #line) {
    assert(!dispatchIsOnMainQueue(), "This must not execute on the main queue!", file: file, line: line)
}
