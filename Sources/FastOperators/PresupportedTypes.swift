// TODO: add Float16 when available
extension Float32: FastOperators {}
extension Float64: FastOperators {}

// TODO: need to see how many cases we have like this and might need a better way so it could keep up and be easily reused without too much repeating
// https://github.com/apple/swift-numerics/blob/5dfc460876510988560170cee3702ab01b89587a/Sources/RealModule/Float80%2BReal.swift#L15
#if (arch(i386) || arch(x86_64)) && !os(Windows) && !os(Android)
extension Float80: FastOperators {}
#endif

extension Int8: FastIntOperators {}
extension Int16: FastIntOperators {}
extension Int32: FastIntOperators {}
extension Int64: FastIntOperators {}

extension UInt8: FastUIntOperators {}
extension UInt16: FastUIntOperators {}
extension UInt32: FastUIntOperators {}
extension UInt64: FastUIntOperators {}

