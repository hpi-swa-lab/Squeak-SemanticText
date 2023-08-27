accessing
centsPerPromptToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class gpt35Name] -> [0.00015].
		[self class gpt35_16kName] -> [0.0003].
		[self class gpt4Name] -> [0.003].
		[self class gpt4_32kName] -> [0.006]}