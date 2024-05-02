function calling
callFunctionAt: functionSelector withArguments: arguments

	^ [self perform: functionSelector withArguments: arguments]
		on: Error do: [:ex |
			self serializeError: ex]