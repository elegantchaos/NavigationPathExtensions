// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 10/10/22.
//  All code (c) 2022 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

/// Something that can decode paths from storage (eg in UserDefaults).
/// We conform JSONDecoder to this automatically, and make an instance
/// of it to use for decoding by default, but a custom decoder can be
/// supplied if required, as long as it conforms to this protocol.
///
/// One reason for supplying a custom decoder is so that you can decode
/// a path component from something static like an identifier into something
/// more dynamic like a core data object -- which needs some extra context
/// during the decoding process.

public protocol PathDecoder {
    func decode(_ type: NavigationPath.CodableRepresentation.Type, from: Data) throws -> NavigationPath.CodableRepresentation
}

extension JSONDecoder: PathDecoder { }
