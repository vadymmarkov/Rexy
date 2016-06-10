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
    XCTAssertEqual(Regex.CFlags.basic.rawValue, REG_BASIC)
    XCTAssertEqual(Regex.CFlags.extended.rawValue, REG_EXTENDED)
    XCTAssertEqual(Regex.CFlags.caseInsensitive.rawValue, REG_ICASE)
    XCTAssertEqual(Regex.CFlags.noPositions.rawValue, REG_NOSUB)
    XCTAssertEqual(Regex.CFlags.newLineSensitive.rawValue, REG_NEWLINE)
    XCTAssertEqual(Regex.CFlags.noSpecialCharacters.rawValue, REG_NOSPEC)
    XCTAssertEqual(Regex.CFlags.literal.rawValue, REG_LITERAL)
    XCTAssertEqual(Regex.CFlags.endPointer.rawValue, REG_PEND)
    XCTAssertEqual(Regex.CFlags.minimal.rawValue, REG_MINIMAL)
    XCTAssertEqual(Regex.CFlags.nonGreedy.rawValue, REG_UNGREEDY)
  }
}
