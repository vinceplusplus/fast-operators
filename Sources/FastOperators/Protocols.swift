public protocol FastBaseOperators {
  static func +󠆰 (lhs: Self, rhs: Self) -> Self
  static func -󠆰 (lhs: Self, rhs: Self) -> Self
  static func *󠆰 (lhs: Self, rhs: Self) -> Self
  static func /󠆰 (lhs: Self, rhs: Self) -> Self
  static func +󠆰=󠆰 (lhs: inout Self, rhs: Self)
  static func -󠆰=󠆰 (lhs: inout Self, rhs: Self)
  static func *󠆰=󠆰 (lhs: inout Self, rhs: Self)
  static func /󠆰=󠆰 (lhs: inout Self, rhs: Self)
  
  prefix static func +󠆰 (operand: Self) -> Self
  
  static func =󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool
  static func !󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool
  static func <󠆰 (lhs: Self, rhs: Self) -> Bool
  static func >󠆰 (lhs: Self, rhs: Self) -> Bool
  static func <󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool
  static func >󠆰=󠆰 (lhs: Self, rhs: Self) -> Bool
}

public protocol FastOperators: FastBaseOperators {
  prefix static func -󠆰 (operand: Self) -> Self
}

public protocol FastUIntOperators: BinaryInteger, FastBaseOperators {
  static func %󠆰 (lhs: Self, rhs: Self) -> Self
  static func %󠆰=󠆰 (lhs: inout Self, rhs: Self)
}

public protocol FastIntOperators: FastUIntOperators, FastOperators {}
