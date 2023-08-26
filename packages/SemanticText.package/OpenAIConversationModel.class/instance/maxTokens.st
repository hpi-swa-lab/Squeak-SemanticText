accessing
maxTokens

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class gpt35Name] -> [4096].
		[self class gpt35_16kName] -> [16384].
		[self class gpt4Name] -> [8192].
		[self class gpt4_32kName] -> [32768]}