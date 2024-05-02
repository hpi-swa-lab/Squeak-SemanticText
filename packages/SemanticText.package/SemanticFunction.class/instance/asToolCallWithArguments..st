converting
asToolCallWithArguments: arguments

	| key |
	key := 'call_' , self makeRandomToolCallKey.
	^ self
		asToolCallWithKey: key
		arguments: arguments