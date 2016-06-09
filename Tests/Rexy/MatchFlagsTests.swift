import XCTest
@testable import Rexy

class MatchFlagsTests: XCTestCase {

  static var allTests: [(String, (MatchFlagsTests) -> () throws -> Void)] {
    return [
      ("testFlags", testFlags)
    ]
  }

  // MARK: - Tests

  func testFlags() {
    XCTAssertEqual(MatchFlags.notAtBeginningOfLine.rawValue, REG_NOTBOL)
    XCTAssertEqual(MatchFlags.notAtEndOfLine.rawValue, REG_NOTEOL)
    XCTAssertEqual(MatchFlags.startEnd.rawValue, REG_STARTEND)
    XCTAssertEqual(MatchFlags.backref.rawValue, REG_BACKR)
  }
}
