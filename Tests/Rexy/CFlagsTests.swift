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
    XCTAssertEqual(CFlags.basic.rawValue, REG_BASIC)
    XCTAssertEqual(CFlags.extended.rawValue, REG_EXTENDED)
    XCTAssertEqual(CFlags.caseInsensitive.rawValue, REG_ICASE)
    XCTAssertEqual(CFlags.noPositions.rawValue, REG_NOSUB)
    XCTAssertEqual(CFlags.newLineSensitive.rawValue, REG_NEWLINE)
    XCTAssertEqual(CFlags.noSpecialCharacters.rawValue, REG_NOSPEC)
    XCTAssertEqual(CFlags.literal.rawValue, REG_LITERAL)
    XCTAssertEqual(CFlags.endPointer.rawValue, REG_PEND)
    XCTAssertEqual(CFlags.minimal.rawValue, REG_MINIMAL)
    XCTAssertEqual(CFlags.nonGreedy.rawValue, REG_UNGREEDY)
  }
}
