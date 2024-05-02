private
makeFunctionFromPragma: aPragma

	| protoFunction function |
	protoFunction := aPragma argumentAt: 1.
	
	function := protoFunction copy.
	function action: [:args |
		| arguments |
		arguments := function parameters
			collect: [:parameter | args at: parameter name]
			as: Array.
		self callFunctionAt: aPragma selector withArguments: arguments].
	^ function