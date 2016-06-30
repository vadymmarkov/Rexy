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
    XCTAssertEqual(Regex.EFlags.notBeginningOfLine.rawValue, 1)
    XCTAssertEqual(Regex.EFlags.notEndOfLine.rawValue, 2)
    XCTAssertEqual(Regex.EFlags.startEnd.rawValue, 4)
  }
}
