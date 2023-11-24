accessing
maxCompletionTokens

	self flag: #modelConstants.
	^ self name
		caseOf:
			{[self class gpt35Name] -> [4096].
			[self class gpt35_16kName] -> [16384].
			[self class gpt4Name] -> [8192].
			[self class gpt4TurboPreviewName] -> [4096]}
		otherwise: [4096 flag: #assumption "not documented! https://community.openai.com/t/what-is-the-maximum-response-length-output-tokens-for-each-gpt-model"]