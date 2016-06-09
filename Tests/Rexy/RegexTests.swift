import XCTest
@testable import Rexy

class RegexTests: XCTestCase {

  static var allTests: [(String, (RegexTests) -> () throws -> Void)] {
    return [
      ("testInitWithValidPattern", testInitWithValidPattern),
      ("testInitWithInvalidPattern", testInitWithInvalidPattern),
      ("testMatches", testMatches)
    ]
  }

  // MARK: - Tests

  func testInitWithValidPattern() {
    var regex: Regex?

    do {
      regex = try Regex(pattern: "rexy")
    } catch {
      XCTFail("`Regex` throws an error: \(error)")
    }

    XCTAssertNotNil(regex)
  }

  func testInitWithInvalidPattern() {
    var regex: Regex?

    do {
      regex = try Regex(pattern: "|-)'-'(-|")
      XCTFail("`Regex` does not throw an error")
    } catch {
      print(error)
    }

    XCTAssertNil(regex)
  }

  func testMatches() {
    //Tyrannosaurus rex
  }
}
