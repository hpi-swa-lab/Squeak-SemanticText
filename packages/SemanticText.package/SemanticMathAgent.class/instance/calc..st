functions
calc: aString
	"Calculate a math expression.
	Second line."
	<function: calc(expression: string "e.g., ""(2+3)*4"" or ""sqrt(5^2)-1""")>

	"Recursive bottom-up evaluation"
	| patterns exp any |
	patterns := self makeCalcPatterns.
	
	exp := aString.
	[any := false.
	patterns keysAndValuesDo: [:pattern :processor |
		| matcher |
		matcher := pattern semanticAsExtendedRegex.
		exp := matcher copy: exp translatingMatchesUsing: [:match |
			any := true.
			self serializeNumber: (processor value: matcher)]]]
		doWhileTrue: [any].
	
	^ self parseNumber: exp