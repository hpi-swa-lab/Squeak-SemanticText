function calling
invokeFunction: aFunction selector: aSymbol withRawArguments: rawArguments

	| arguments |
	arguments :=
		[self assert: aFunction parameters isDictionary description: 'arguments must be a dictionary'.
		[aFunction parameters
			collect: [:parameter | rawArguments at: parameter name]
			as: Array]
				on: Error do: [:ex |
					self error: 'Invalid function call: ', ex]]
				on: Error do: [:ex |
					^ self serializeError: ex].
	
	^ self callFunctionAt: aSymbol withArguments: arguments