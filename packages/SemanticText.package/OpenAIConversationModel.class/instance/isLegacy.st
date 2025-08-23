testing
isLegacy

	self flag: #modelConstants.
	
	^ {self class gpt35Turbo0613Name. self class gpt35Turbo1106Name. self class gpt35Turbo0125Name. self class gpt35Turbo16k0613Name. self class gpt35Turbo16kName. self class gpt35_16kName. self class gpt45Preview_20250227Name. self class chatgpt4oLatestName. self class gpt4_20240409Name. self class gpt4_0125Name. self class gpt4_1106Name. self class gpt4_0613Name. self class gpt4_32k0613Name} includes: self resolvedName