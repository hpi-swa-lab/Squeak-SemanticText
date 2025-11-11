accessing
maxTokens

	self flag: #modelConstants.
	
	(self resolvedName beginsWith: self class gptAudioName) ifTrue:
		[^ 128000].
	
	(self resolvedName beginsWith: self class gpt35TurboName) ifTrue:
		["self name = self class gpt35TurboInstructName ifTrue: [^ 4096]."
		(self resolvedName = self class gpt35Turbo1106Name or: [self resolvedName = self class gpt35Turbo0613Name]) ifTrue: [^ 4096].
		(self resolvedName beginsWith: self class gpt35Turbo16kName) ifTrue: [^ 16385].
		^ 16385].
	
	(self resolvedName beginsWith: self class gpt4Name) ifTrue:
		[((self resolvedName beginsWithAnyOf: {self class gpt4oMiniName. self class gpt4oName}) or: [self resolvedName = self class gpt4_0125Name] or: [self resolvedName = self class gpt4_1106Name]) ifTrue: [^ 128000].
		(self resolvedName beginsWith: self class gpt41Name) ifTrue: [^ 1047576].
		(self resolvedName beginsWith: self class gpt45PreviewName) ifTrue: [^ 128000].
		(self resolvedName beginsWith: self class gpt4_32kName) ifTrue: [^ 32768].
		^ 8192].
	self resolvedName = self class chatgpt4oLatestName ifTrue:
		[^ 128000].
	
	(self resolvedName beginsWith: self class gpt5Name) ifTrue: [^ 400000].
	
	((self resolvedName beginsWith: self class o1PreviewName) or: [self resolvedName beginsWith: self class o1MiniName]) ifTrue:
		[^ 128000].
	(self resolvedName beginsWith: self class o1Name) ifTrue:
		[^ 200000].
	
	(self resolvedName beginsWith: self class o3Name) ifTrue:
		[^ 200000].
	(self resolvedName beginsWith: self class o4MiniName) ifTrue:
		[^ 200000].
	
	^ self resolvedName caseError