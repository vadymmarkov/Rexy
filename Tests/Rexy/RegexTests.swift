import XCTest
@testable import Rexy

class RegexTests: XCTestCase {

  static var allTests: [(String, (RegexTests) -> () throws -> Void)] {
    return [
      ("testInitWithValidPattern", testInitWithValidPattern),
      ("testInitWithInvalidPattern", testInitWithInvalidPattern),
      ("testMatches", testIsMatch),
      ("testNotMatches", testIsNotMatch),
      ("testMatch", testMatch),
      ("testMatches", testMatches),
      ("testGroup", testGroup),
      ("testGroups", testGroups),
      ("testNoGroups", testNoGroups),
      ("testReplace", testReplace),
      ("testNoReplace", testNoReplace)
    ]
  }

  // MARK: - Tests

  func testInitWithValidPattern() {
    var regex: Regex?

    do {
      regex = try Regex("rexy")
    } catch {
      XCTFail("`Regex` throws an error: \(error)")
    }

    XCTAssertNotNil(regex)
  }

  func testInitWithInvalidPattern() {
    var regex: Regex?

    do {
      regex = try Regex("|-)'-'(-|")
      XCTFail("`Regex` does not throw an error")
    } catch {
      print(error)
    }

    XCTAssertNil(regex)
  }

  func testIsMatch() {
    let regex = try! Regex("Tyrannosaurus")
    XCTAssertTrue(regex.isMatch("Tyrannosaurus"))
    XCTAssertTrue("Tyrannosaurus" =~ regex)
    XCTAssertTrue("Tyrannosaurus" =~ "T.*")
  }

  func testIsNotMatch() {
    let regex = try! Regex("Tyrannosaurus")

    XCTAssertFalse(regex.isMatch("Spinosaurus"))
    XCTAssertTrue("Spinosaurus" !~ regex)
    XCTAssertTrue("Spinosaurus" !~ "T.*")
  }

  func testMatch() {
    let regex = try! Regex("[a-z]+")
    XCTAssertEqual(regex.match("a1b1"), "a")
  }

  func testMatches() {
    let regex = try! Regex("[a-z]+")
    XCTAssertEqual(regex.matches("a1b1"), ["a", "b"])
  }

  func testGroup() {
    let regex = try! Regex("(Tyrannosaurus)")
    let groups = regex.groups("Tyrannosaurus")

    XCTAssertEqual(groups, ["Tyrannosaurus"])
  }

  func testGroups() {
    let regex = try! Regex("(Tyrannosaurus) (Rex)")
    let groups = regex.groups("Tyrannosaurus Rex")

    XCTAssertEqual(groups, ["Tyrannosaurus", "Rex"])
  }

  func testNoGroups() {
    let regex = try! Regex("(Tyrannosaurus)")
    let groups = regex.groups("Spinosaurus")

    XCTAssertTrue(groups.isEmpty)
  }

  func testReplace() {
    let regex = try! Regex("Tyrannosaurus")
    let string = regex.replace("Tyrannosaurus Rex Tyrannosaurus", with: "Dinosaur")

    XCTAssertEqual(string, "Dinosaur Rex Dinosaur")
  }

  func testNoReplace() {
    let regex = try! Regex("Spinosaurus")
    let string = regex.replace("Tyrannosaurus Rex", with: "Dinosaur")

    XCTAssertEqual(string, "Tyrannosaurus Rex")
  }
}
