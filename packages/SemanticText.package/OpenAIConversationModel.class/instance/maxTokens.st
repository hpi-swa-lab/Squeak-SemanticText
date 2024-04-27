accessing
maxTokens

	self flag: #modelConstants.
	
	(self resolvedName beginsWith: self class gpt35TurboName) ifTrue:
		["self name = self class gpt35TurboInstructName ifTrue: [^ 4096]."
		(self resolvedName = self class gpt35Turbo1106Name or: [self resolvedName = self class gpt35Turbo0613Name]) ifTrue: [^ 4096].
		(self resolvedName beginsWith: self class gpt35Turbo16kName) ifTrue: [^ 16385].
		^ 16385].
	
	(self resolvedName beginsWith: self class gpt4Name) ifTrue:
		[(self resolvedName = self class gpt4_20240409Name or: [self resolvedName = self class gpt4_0125Name] or: [self resolvedName = self class gpt4_1106Name]) ifTrue: [^ 128000].
		(self resolvedName beginsWith: self class gpt4_32kName) ifTrue: [^ 32768].
		^ 8192].
	
	^ self resolvedName caseError