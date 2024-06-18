private
makeFunctionFromPragma: aPragma

	| protoFunction function |
	protoFunction := aPragma argumentAt: 1.
	
	function := protoFunction copy.
	function action: [:args |
		self
			invokeFunction: function
			selector: aPragma selector
			withRawArguments: args].
	^ function