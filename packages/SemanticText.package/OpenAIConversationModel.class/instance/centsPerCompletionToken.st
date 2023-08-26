pricing
centsPerCompletionToken

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class gpt35Name] -> [0.0002].
		[self class gpt35_16kName] -> [0.0004].
		[self class gpt4Name] -> [0.006].
		[self class gpt4_32kName] -> [0.012]}