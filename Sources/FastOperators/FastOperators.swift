
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
