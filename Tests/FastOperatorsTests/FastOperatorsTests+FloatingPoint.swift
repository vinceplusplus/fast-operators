import XCTest
@testable import FastOperators

extension FastOperatorsTests {
  private func testGenerically<T: BinaryFloatingPoint & FastOperators>(_ type: T.Type) {
    let a: T = 2
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
    XCTAssertEqual(-󠆰a, -a)

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
  }
  
  func testFloatingPointOperators() {
    testGenerically(Float32.self)
    testGenerically(Float64.self)
    
    // https://github.com/apple/swift-numerics/blob/5dfc460876510988560170cee3702ab01b89587a/Sources/RealModule/Float80%2BReal.swift#L15
    #if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
    testGenerically(Float80.self)
    #endif
  }
}
