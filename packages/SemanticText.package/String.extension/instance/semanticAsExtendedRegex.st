*SemanticText-*Regex-Core
semanticAsExtendedRegex
	"Compile the receiver as a regex matcher using extended syntax (ignore whitespaces and line comments starting with '#')."

	| matcher compactPattern |
	matcher := '(?:^(?:\s(?<![\r\n]))*(?:(\\.|[^#\s])(?:\s(?<![\r\n]))*)*(?:#(?:[^\r\n])*)?$[\r\n]*)*' asRegex.
	(matcher matches: self) ifFalse:
		[^ self error: 'invalid extended regex pattern'].
	compactPattern := (matcher subexpressions: 2) join.
	^ compactPattern asRegex