import XCTest
@testable import Rexy

class EFlagsTests: XCTestCase {

  static var allTests: [(String, (EFlagsTests) -> () throws -> Void)] {
    return [
      ("testFlags", testFlags)
    ]
  }

  // MARK: - Tests

  func testFlags() {
    XCTAssertEqual(EFlags.notAtBeginningOfLine.rawValue, REG_NOTBOL)
    XCTAssertEqual(EFlags.notAtEndOfLine.rawValue, REG_NOTEOL)
    XCTAssertEqual(EFlags.startEnd.rawValue, REG_STARTEND)
    XCTAssertEqual(EFlags.backref.rawValue, REG_BACKR)
  }
}
