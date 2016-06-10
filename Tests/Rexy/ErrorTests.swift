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
    let error = Error(from: result, compiledPattern: compiledPattern)

    var buffer = [Int8](repeating: 0, count: Int(BUFSIZ))
    regerror(result, &compiledPattern, &buffer, buffer.count)
    let description = String(validatingUTF8: buffer) ?? ""

    XCTAssertEqual(error.description, description)
  }
}
