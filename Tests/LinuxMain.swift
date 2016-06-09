#if os(Linux)

import XCTest
@testable import RexyTestSuite

XCTMain([
  testCase(RexyTests.allTests),
])

#endif
