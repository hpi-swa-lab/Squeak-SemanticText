accessing
arguments

	^ super arguments ifNil:
		[self streamedArgumentsString]