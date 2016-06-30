import XCTest
@testable import Rexy

class CFlagsTests: XCTestCase {

  static var allTests: [(String, (CFlagsTests) -> () throws -> Void)] {
    return [
      ("testFlags", testFlags)
    ]
  }

  // MARK: - Tests

  func testFlags() {
    XCTAssertEqual(Regex.CFlags.basic.rawValue, 0)
    XCTAssertEqual(Regex.CFlags.extended.rawValue, 1)
    XCTAssertEqual(Regex.CFlags.caseInsensitive.rawValue, 2)
    XCTAssertEqual(Regex.CFlags.ignorePositions.rawValue, 3)
    XCTAssertEqual(Regex.CFlags.newLineSensitive.rawValue, 4)
    XCTAssertEqual(Regex.CFlags.ignoreSpecialCharacters.rawValue, 5)
    XCTAssertEqual(Regex.CFlags.literal.rawValue, 6)
    XCTAssertEqual(Regex.CFlags.endPointer.rawValue, 7)
    XCTAssertEqual(Regex.CFlags.minimal.rawValue, 8)
    XCTAssertEqual(Regex.CFlags.nonGreedy.rawValue, 9)
  }
}
