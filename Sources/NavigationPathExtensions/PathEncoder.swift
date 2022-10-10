// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 10/10/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

/// Something that can encode paths.
/// We conform JSONEncoder to this automatically, and use it by default,
/// but another encoder can be supplied if required.
public protocol PathEncoder {
    func encode(_ value: NavigationPath.CodableRepresentation) throws -> Data
}

extension JSONEncoder: PathEncoder { }
