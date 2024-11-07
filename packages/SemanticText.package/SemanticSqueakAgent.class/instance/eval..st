functions
eval: aString
	"Evaluate a Smalltalk expression in the running Squeak image."
	<function: eval(
		expression: string "e.g., ""DateAndTime now"" or ""| collection | collection := 1 to: 10. collection inject: 0 into: [:a :b | a + b]"""
	)>

	^ Compiler evaluate: aString