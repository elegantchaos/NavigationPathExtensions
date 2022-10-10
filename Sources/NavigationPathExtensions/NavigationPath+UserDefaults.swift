// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 10/10/2022.
//  All code (c) 2022 - present day, Sam Deane.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public extension UserDefaults {
    enum Error: Swift.Error {
        case pathIsNotCodable
    }
    
    /// Store a path.
    /// By default we encode it as JSON data, but another encoder can be supplied if required.
    func set(_ path: NavigationPath, forKey key: String, encoder: PathEncoder = JSONEncoder()) throws {
        guard let representation = path.codable else { throw Error.pathIsNotCodable }
        let encoded = try encoder.encode(representation)
        set(encoded, forKey: key)
    }

    /// Retrieve a path.
    /// By default we decode it as JSON data, but another decoder can be supplied is required.
    func path(forKey key: String, decoder: PathDecoder = JSONDecoder()) throws -> NavigationPath? {
        guard let data = value(forKey: key) as? Data else { return nil }
        let representation = try decoder.decode(NavigationPath.CodableRepresentation.self, from: data)
        return NavigationPath(representation)
    }
}
