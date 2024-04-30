converting
asToolCallWithArguments: arguments

	^ self
		asToolCallWithKey: 'call_' , UUID new
		arguments: arguments