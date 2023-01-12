//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===--------------------------------------------------------------------

import Foundation

struct Email: CustomStringConvertible {
    var description: String

    public init(_ emailString: String) throws {
        let regex = #"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}"#
        guard let _ = emailString.range(of: regex, options: .regularExpression) else {
            throw InvalidEmailError(email: emailString)
        }
        self.description = emailString
    }
}

private struct InvalidEmailError: Error {
    let email: String
}
