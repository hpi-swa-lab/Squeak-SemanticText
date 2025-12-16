initialize-release
parseArguments: argumentsString

	super parseArguments: argumentsString.
	self arguments isString ifTrue:
		[self arguments: nil.
		self streamedArgumentsString: argumentsString].