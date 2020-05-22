public extension FastBaseOperators where Self: Numeric {
  static func +󠆰 (lhs: Self, rhs: Self) -> Self { lhs + rhs }
  static func -󠆰 (lhs: Self, rhs: Self) -> Self { lhs - rhs }
  static func *󠆰 (lhs: Self, rhs: Self) -> Self { lhs * rhs }
  static func +󠆰=󠆰 (lhs: inout Self, rhs: Self) { lhs += rhs }
  static func -󠆰=󠆰 (lhs: inout Self, rhs: Self) { lhs -= rhs }
  static func *󠆰=󠆰 (lhs: inout Self, rhs: Self) { lhs *= rhs }
  
  prefix static func +󠆰 (operand: Self) -> Self { operand }
  
  static func =󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool { lhs == rhs }
  static func !󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool { lhs != rhs }
}

public extension FastBaseOperators where Self: FloatingPoint {
  static func /󠆰 (lhs: Self, rhs: Self) -> Self { lhs / rhs }
  static func /󠆰=󠆰 (lhs: inout Self, rhs: Self) { lhs /= rhs }
  
  static func <󠆰 (lhs: Self, rhs: Self) -> Bool { lhs < rhs }
  static func >󠆰 (lhs: Self, rhs: Self) -> Bool { lhs > rhs }
  static func <󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool { lhs <= rhs }
  static func >󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool { lhs >= rhs }
}

public extension FastBaseOperators where Self: BinaryInteger {
  static func /󠆰 (lhs: Self, rhs: Self) -> Self { lhs / rhs }
  static func /󠆰=󠆰 (lhs: inout Self, rhs: Self) { lhs /= rhs }
  
  static func <󠆰 (lhs: Self, rhs: Self) -> Bool { lhs < rhs }
  static func >󠆰 (lhs: Self, rhs: Self) -> Bool { lhs > rhs }
  static func <󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool { lhs <= rhs }
  static func >󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool { lhs >= rhs }
}

public extension FastOperators where Self: SignedNumeric {
  prefix static func -󠆰 (operand: Self) -> Self { -operand }
}

public extension FastUIntOperators {
  static func %󠆰 (lhs: Self, rhs: Self) -> Self { lhs % rhs }
  static func %󠆰=󠆰 (lhs: inout Self, rhs: Self) { lhs %= rhs }
}
