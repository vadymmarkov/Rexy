import XCTest
import PathKit
@testable import Rexy

class RexyTests: XCTestCase {

  static var allTests: [(String, (RexyTests) -> () throws -> Void)] {
    return [
      ("testInit", testInit)
    ]
  }

  override func setUp() {
    super.setUp()
  }

  // MARK: - Tests

  func testInit() {
    XCTAssertTrue(true)
  }
}
