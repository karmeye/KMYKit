//
//  String+KMY.swift
//  KMYKit
//
//  Created on 2017-11-04.
//  Copyright © 2017 Karmeye. All rights reserved.
//

import Foundation

extension String {

    /**
     Will trim non-visible characters from the string.

     - Note: Non-visible characters includes space characters, tabs, newlines, carriage returns, and any similar characters that do not have a visible representation.
     - Returns: A new trimmed string.
     */
    public func kmyTrimNonVisibleCharacters() -> String {
        return _kmyStringTrimNonVisibleCharacters(self)!
    }

    /**
     Determines if a string contains visible characters by trimming non-visible characters and checking if the length of the result is > 0.

     Non-visible characters includes space characters, tabs, newlines, carriage returns, and any similar characters that do not have a visible representation.

     - Note: This function is useful to determine if a string is empty.
     - Returns: `true` if the string contains visible characters.
     */
    public func kmyContainsVisibleCharacters() -> Bool {
        return _kmyStringContainsVisibleCharacters(self)
    }
}
