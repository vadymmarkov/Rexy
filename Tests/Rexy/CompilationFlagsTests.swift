import XCTest
@testable import Rexy

class CompilationFlagsTests: XCTestCase {

  static var allTests: [(String, (CompilationFlagsTests) -> () throws -> Void)] {
    return [
      ("testFlags", testFlags)
    ]
  }

  // MARK: - Tests

  func testFlags() {
    XCTAssertEqual(CompilationFlags.basic.rawValue, REG_BASIC)
    XCTAssertEqual(CompilationFlags.extended.rawValue, REG_EXTENDED)
    XCTAssertEqual(CompilationFlags.caseInsensitive.rawValue, REG_ICASE)
    XCTAssertEqual(CompilationFlags.noPositions.rawValue, REG_NOSUB)
    XCTAssertEqual(CompilationFlags.newLineSensitive.rawValue, REG_NEWLINE)
    XCTAssertEqual(CompilationFlags.noSpecialCharacters.rawValue, REG_NOSPEC)
    XCTAssertEqual(CompilationFlags.literal.rawValue, REG_LITERAL)
    XCTAssertEqual(CompilationFlags.endPointer.rawValue, REG_PEND)
    XCTAssertEqual(CompilationFlags.minimal.rawValue, REG_MINIMAL)
    XCTAssertEqual(CompilationFlags.nonGreedy.rawValue, REG_UNGREEDY)
  }
}
