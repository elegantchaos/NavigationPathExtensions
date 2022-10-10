// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 10/10/2022.
//  All code (c) 2022 - present day, Sam Deane.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI

public extension UserDefaults {
    enum Error: Swift.Error {
        case pathIsNotCodable
    }
    
    func set(_ path: NavigationPath, forKey key: String) throws {
        guard let representation = path.codable else { throw Error.pathIsNotCodable }
        let encoder = JSONEncoder()
        let encoded = try encoder.encode(representation)
        set(encoded, forKey: key)
    }
    
    func path(forKey key: String) throws -> NavigationPath? {
        guard let data = value(forKey: key) as? Data else { return nil }

        let representation = try JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data)
        return NavigationPath(representation)
    }
}
