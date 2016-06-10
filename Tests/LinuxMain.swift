#if os(Linux)

import XCTest
@testable import RexyTestSuite

XCTMain([
  testCase(CFlagsTests.allTests),
  testCase(EFlagsTests.allTests),
  testCase(ErrorTests.allTests),
  testCase(RegexTests.allTests),
])

#endif
