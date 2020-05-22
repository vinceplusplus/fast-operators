import XCTest
@testable import FastOperators

extension FastOperatorsTests {
  func testGenerically<T: BinaryInteger & FastUIntOperators>(_ type: T.Type) {
    let a: T = 8
    let b: T = 3
    var c1: T = 0
    var c2: T = 0
    XCTAssertEqual(a +󠆰 b, a + b)
    XCTAssertEqual(a -󠆰 b, a - b)
    XCTAssertEqual(a *󠆰 b, a * b)
    XCTAssertEqual(a /󠆰 b, a / b)
    
    c1 = a
    c2 = a
    c1 +󠆰=󠆰 b
    c2 += b
    XCTAssertEqual(c1, c2)
    c1 = a
    c2 = a
    c1 -󠆰=󠆰 b
    c2 -= b
    XCTAssertEqual(c1, c2)
    c1 = a
    c2 = a
    c1 *󠆰=󠆰 b
    c2 *= b
    XCTAssertEqual(c1, c2)
    c1 = a
    c2 = a
    c1 /󠆰=󠆰 b
    c2 /= b
    XCTAssertEqual(c1, c2)
    
    XCTAssertEqual(+󠆰a, +a)

    XCTAssertEqual(a =󠆰=󠆰 a, a == a)
    XCTAssertEqual(a =󠆰=󠆰 b, a == b)
    XCTAssertEqual(a !󠆰=󠆰 a, a != a)
    XCTAssertEqual(a !󠆰=󠆰 b, a != b)
    XCTAssertEqual(a <󠆰 a, a < a)
    XCTAssertEqual(a <󠆰 b, a < b)
    XCTAssertEqual(a >󠆰 a, a > a)
    XCTAssertEqual(a >󠆰 b, a > b)
    XCTAssertEqual(a <󠆰=󠆰 a, a <= a)
    XCTAssertEqual(a <󠆰=󠆰 b, a <= b)
    XCTAssertEqual(a >󠆰=󠆰 a, a >= a)
    XCTAssertEqual(a >󠆰=󠆰 b, a >= b)
    
    XCTAssertEqual(a %󠆰 b, a % b)
    
    c1 = a
    c2 = a
    c1 %󠆰=󠆰 b
    c2 %= b
    XCTAssertEqual(c1, c2)
  }
  func testSignedGenerically<T: SignedInteger & FastIntOperators>(_ type: T.Type) {
    let a: T = 8
    XCTAssertEqual(-󠆰a, -a)
  }
  func testIntegerOperators() {
    testGenerically(UInt8.self)
    testGenerically(UInt16.self)
    testGenerically(UInt32.self)
    testGenerically(UInt64.self)
    
    testGenerically(Int8.self)
    testGenerically(Int16.self)
    testGenerically(Int32.self)
    testGenerically(Int64.self)
    
    testSignedGenerically(Int8.self)
    testSignedGenerically(Int16.self)
    testSignedGenerically(Int32.self)
    testSignedGenerically(Int64.self)
  }
}
