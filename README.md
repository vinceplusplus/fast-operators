<p>
  <a href="https://github.com/vinceplusplus/fast-operators/actions?query=workflow%3Atest+event%3Apush">
    <img src="https://github.com/vinceplusplus/fast-operators/workflows/test/badge.svg?event=push">
  </a>
  <a href="https://codecov.io/gh/vinceplusplus/fast-operators">
    <img src="https://codecov.io/gh/vinceplusplus/fast-operators/branch/master/graph/badge.svg?token=XPHA5YC5KX" />
  </a>
</p>

# fast-operators

Use `fast-operators` to eliminate or mitigate very long type-checking times if breaking up expressions is not an option

The following code could easily take up more than 20 seconds to compile:
```swift
func foo<T: BinaryFloatingPoint>(_ type: T.Type) {
  let a: T = 2
  let b: T = 3
  let c: T = 4
  let d: T = 5
  let e: T = 6
  let f: T = 7
  let g = -0.5 * a * c * c + (f * (d - e) + a * b) * c
  print(g)
}
```

By using `fast-operators`, the expression takes roughly less than 400ms to compile, a 98% reduction!!!

## Usage

### Installation

To install through Xcode, follow the [official guide](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) to add the following your Xcode project
```
https://github.com/vinceplusplus/fast-operators
```

To install through Swift Package Manager, add the following as package dependency and target dependency respectively
```
.package(url: "https://github.com/vinceplusplus/fast-operators", from: "1.0.0")
```
```
"FastOperators" // or .product(name: "FastOperators", package: "fast-operators")
```

### Integration

Find out the lines causing long compilation times

For an Xcode project, add the following `Other Swift Flags`
```
-Xfrontend -warn-long-function-bodies=100
-Xfrontend -warn-long-expression-type-checking=100
```

For a Swift package project, add the following to the target (but remove them when done)
```swift
swiftSettings: [
  .unsafeFlags([
    "-Xfrontend",
    "-warn-long-function-bodies=100",
    "-Xfrontend",
    "-warn-long-expression-type-checking=100",
  ]),
]
```

Build the project once, examine the issues tab and look for the following
- Expression took XXXms to type-check
- Instance method `YYY` took XXXms to type-check 

```swift
import FastOperators
```

Replace the regular operators with ones in the following (**select** and **copy** the operator characters below)

```swift
// MARK: - Common arithmetic operators
infix operator +󠆰: AdditionPrecedence
infix operator -󠆰: AdditionPrecedence
infix operator *󠆰: MultiplicationPrecedence
infix operator /󠆰: MultiplicationPrecedence
infix operator +󠆰=󠆰: AssignmentPrecedence
infix operator -󠆰=󠆰: AssignmentPrecedence
infix operator *󠆰=󠆰: AssignmentPrecedence
infix operator /󠆰=󠆰: AssignmentPrecedence
prefix operator +󠆰

// MARK: - Unary minus operator (signed types only)
prefix operator -󠆰

// MARK: - Comparison operators
infix operator =󠆰=󠆰: ComparisonPrecedence
infix operator !󠆰=󠆰: ComparisonPrecedence
infix operator <󠆰: ComparisonPrecedence
infix operator >󠆰: ComparisonPrecedence
infix operator <󠆰=󠆰: ComparisonPrecedence
infix operator >󠆰=󠆰: ComparisonPrecedence

// MARK: - Integer only arithmetic operators
infix operator %󠆰: MultiplicationPrecedence
infix operator %󠆰=󠆰: AssignmentPrecedence
```

If you use generics, add one of the following interfaces
```swift
FastOperators     // Floating point types
FastUIntOperators // Unsigned integer types
FastIntOperators  // signed integer types
```
e.g.
```swift
func foo<T: BinaryFloatingPoint & FastOperators>(_ a: T, _ b: T) {
```

## Why?

The type checker problem has been there for quite some time and the typical solution is to break up the expressions. However, breaking up expresions at times make them look less readable, this library is an attempt to keep the "original" expressions as much as possible.

From my experience, the long compilation times look like the compiler is trying to exhaust every possible compatible type to give the best match to the resulting AST or something like this. So to mitigate the problem, we want to narrow down the searches to be done by the compiler.

So, we could define new custom operators and limit the overloads to minimal. However, we want the operators to look as much like the originals as possible. Finally, thanks to the great unicode support from Swift, we could abuse the variation selectors to make the custom operators look exactly like the originals. To avoid collision as much as possible, this library will use the 193rd variation selector for each of the symbols, e.g. `"+\u{e01b0}"`. 

One of the cons of the solution is that it's still some hack and should be there temporarily but yet it is hard to differentiate them from the originals. The color of custom operators is cyan while the original is purple in Xcode.

However, if replacing with the custom operators is still not enough then we might only resort to breaking up the expressions. If it's number literals then could try the `as` cast, e.g. replace `-0.5` with `(-0.5 as T)` (or `(-0.5 as Float)` if the type is concrete). 

In closing, if the problem is solved one day by a new release of the compiler, we could just replace the operators back. 

## Alternatives considered

- Functions such as `mul()`, `add()`, etc, the problem is poor readability
- Unicode characters like `⧾`, `⧿`, etc, the problem is that they look weird
