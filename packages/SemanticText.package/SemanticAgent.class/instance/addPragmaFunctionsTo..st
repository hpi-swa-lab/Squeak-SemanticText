private
addPragmaFunctionsTo: aConversation

	| pragmas |
	pragmas := #(function: function:streamingArguments:) gather: [:selector |
		Pragma allNamed: selector from: self class to: thisContext methodClass].
	pragmas := pragmas sorted: [:pragma | self orderedFunctionNames indexOf: pragma selector ifAbsent: [nil]] ascending undefinedLast.
	CurrentReadOnlySourceFiles cacheDuring:
		[pragmas do: [:pragma |
			aConversation addFunction:
				(self makeFunctionFromPragma: pragma)]].