import XCTest
@testable import Rexy

class RegexTests: XCTestCase {

  static var allTests: [(String, (RegexTests) -> () throws -> Void)] {
    return [
      ("testInitWithValidPattern", testInitWithValidPattern),
      ("testInitWithInvalidPattern", testInitWithInvalidPattern),
      ("testMatches", testMatchesWhenMatch),
      ("testMatchesWhenNotMatch", testMatchesWhenNotMatch)
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

  func testMatchesWhenMatch() {
    let regex = try! Regex(pattern: "Tyrannosaurus")
    let result = regex.matches("Tyrannosaurus")

    XCTAssertTrue(result)
  }

  func testMatchesWhenNotMatch() {
    let regex = try! Regex(pattern: "Tyrannosaurus")
    let result = regex.matches("Spinosaurus")

    XCTAssertFalse(result)
  }
}
