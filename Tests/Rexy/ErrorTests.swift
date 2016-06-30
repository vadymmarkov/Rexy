#if os(Linux)
  import Glibc
#else
  import Darwin.C
#endif

import XCTest
@testable import Rexy

class ErrorTests: XCTestCase {

  static var allTests: [(String, (ErrorTests) -> () throws -> Void)] {
    return [
      ("testInit", testInit)
    ]
  }

  // MARK: - Tests

  func testInit() {
    var compiledPattern = regex_t()
    let result = regcomp(&compiledPattern, "(ツ)", Regex.CFlags.extended.rawValue)
    let error = Error(result: result, compiledPattern: compiledPattern)

    var buffer = [Int8](repeating: 0, count: Int(1024))
    regerror(result, &compiledPattern, &buffer, buffer.count)
    let description = String(validatingUTF8: buffer) ?? ""

    XCTAssertEqual(error.description, description)
  }
}
