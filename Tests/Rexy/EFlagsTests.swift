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
    XCTAssertEqual(Regex.EFlags.notAtBeginningOfLine.rawValue, REG_NOTBOL)
    XCTAssertEqual(Regex.EFlags.notAtEndOfLine.rawValue, REG_NOTEOL)
    XCTAssertEqual(Regex.EFlags.startEnd.rawValue, REG_STARTEND)
  }
}
