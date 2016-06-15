import XCTest
@testable import Rexy

class RegexTests: XCTestCase {

  static var allTests: [(String, (RegexTests) -> () throws -> Void)] {
    return [
      ("testInitWithValidPattern", testInitWithValidPattern),
      ("testInitWithInvalidPattern", testInitWithInvalidPattern),
      ("testMatches", testMatches),
      ("testNotMatches", testNotMatches),
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
    let regex = try! Regex(pattern: "Tyrannosaurus")
    XCTAssertTrue(regex.matches("Tyrannosaurus"))
    XCTAssertTrue("Tyrannosaurus" =~ regex)
    XCTAssertTrue("Tyrannosaurus" =~ "T.*")
  }

  func testNotMatches() {
    let regex = try! Regex(pattern: "Tyrannosaurus")

    XCTAssertFalse(regex.matches("Spinosaurus"))
    XCTAssertTrue("Spinosaurus" !~ regex)
    XCTAssertTrue("Spinosaurus" !~ "T.*")
  }

  func testGroup() {
    let regex = try! Regex(pattern: "(Tyrannosaurus)")
    let groups = regex.groups("Tyrannosaurus")

    XCTAssertEqual(groups, ["Tyrannosaurus"])
  }

  func testGroups() {
    let regex = try! Regex(pattern: "(Tyrannosaurus) (Rex)")
    let groups = regex.groups("Tyrannosaurus Rex")

    XCTAssertEqual(groups, ["Tyrannosaurus", "Rex"])
  }

  func testNoGroups() {
    let regex = try! Regex(pattern: "(Tyrannosaurus)")
    let groups = regex.groups("Spinosaurus")

    XCTAssertTrue(groups.isEmpty)
  }

  func testReplace() {
    let regex = try! Regex(pattern: "Tyrannosaurus")
    let string = regex.replace("Tyrannosaurus Rex Tyrannosaurus", with: "Dinosaur")

    XCTAssertEqual(string, "Dinosaur Rex Dinosaur")
  }

  func testNoReplace() {
    let regex = try! Regex(pattern: "Spinosaurus")
    let string = regex.replace("Tyrannosaurus Rex", with: "Dinosaur")

    XCTAssertEqual(string, "Tyrannosaurus Rex")
  }
}
