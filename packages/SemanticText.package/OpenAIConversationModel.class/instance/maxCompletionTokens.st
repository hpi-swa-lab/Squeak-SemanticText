accessing
maxCompletionTokens

	self flag: #modelConstants.
	self flag: #assumptions. "Documentation of maximum output lengths is incomplete! These numbers are taken from the OpenAI Playground (https://platform.openai.com/playground?mode=chat). They are inconsistent to both the official documentation (https://platform.openai.com/docs/models) and the error messages from the API. See: https://community.openai.com/t/what-is-the-maximum-response-length-output-tokens-for-each-gpt-model"
	
	(self resolvedName beginsWith: self class gpt35TurboName) ifTrue:
		["self name = self class gpt35TurboInstructName ifTrue: [^ 4096]."
		(self resolvedName beginsWith: self class gpt35Turbo16kName) ifTrue: [^ 16385].
		^ 4096].
	
	(self resolvedName beginsWith: self class gpt4Name) ifTrue:
		[(self resolvedName = self class gpt4o_20240513Name or: [self resolvedName = self class gpt4_20240409Name] or: [self resolvedName = self class gpt4_0125Name] or: [self resolvedName = self class gpt4_1106Name]) ifTrue: [^ 4096].
		(self resolvedName beginsWith: self class gpt4_32kName) ifTrue: [^ 32768].
		^ 8192].
	
	^ self resolvedName caseError