// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 10/10/2022.
//  All code (c) 2022 - present day, Sam Deane.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import SwiftUI
import XCTest
import XCTestExtensions

@testable import NavigationPathExtensions

final class NavigationPathExtensionsTests: XCTestCase {
    func testString() {
        var path = NavigationPath()
        path.append("test")
        
        let defaults = UserDefaults()
        XCTAssertNoThrow(try defaults.set(path, forKey: "test"))
        
        let restored = try? defaults.path(forKey: "test")
        XCTAssertNotNil(restored)
        XCTAssertEqual(path.count, restored?.count)
    }
}
