accessing
maxCompletionTokens

	self flag: #modelConstants.
	self flag: #assumptions. "Documentation of maximum output lengths is incomplete! These numbers are taken from the OpenAI Playground (https://platform.openai.com/playground?mode=chat). They are inconsistent to both the official documentation (https://platform.openai.com/docs/models) and the error messages from the API. See: https://community.openai.com/t/what-is-the-maximum-response-length-output-tokens-for-each-gpt-model"
	
	(self resolvedName beginsWith: self class gptRealtimeName) ifTrue:
		[^ 4096].
	
	(self resolvedName beginsWith: self class gptAudioName) ifTrue:
		[^ 16384].
	
	(self resolvedName beginsWith: self class gpt35TurboName) ifTrue:
		["self name = self class gpt35TurboInstructName ifTrue: [^ 4096]."
		(self resolvedName beginsWith: self class gpt35Turbo16kName) ifTrue: [^ 16385].
		^ 4096].
	
	(self resolvedName beginsWith: self class gpt4Name) ifTrue:
		[(self resolvedName = self class gpt4o_20240513Name or: [self resolvedName = self class gpt4oMini_20240718Name] or: [self resolvedName = self class gpt4_20240409Name] or: [self resolvedName = self class gpt4_0125Name] or: [self resolvedName = self class gpt4_1106Name]) ifTrue: [^ 4096].
		(self resolvedName beginsWithAnyOf: {self class gpt4oRealtimeName. self class gpt4oMiniRealtimeName}) ifTrue: [^ 4096].
		(self resolvedName beginsWith: self class gpt4oMiniName) ifTrue: [^ 16384].
		(self resolvedName beginsWithAnyOf: {self class gpt4oAudioPreviewName. self class gpt4oMiniAudioPreviewName}) ifTrue: [^ 16384].
		(self resolvedName beginsWith: self class gpt4_32kName) ifTrue: [^ 32768].
		(self resolvedName beginsWith: self class gpt4oName) ifTrue: [^ 16384].
		(self resolvedName beginsWith: self class gpt41Name) ifTrue: [^ 32768].
		(self resolvedName beginsWith: self class gpt45PreviewName) ifTrue: [^ 16384].
		^ 8192].
	self resolvedName = self class chatgpt4oLatestName ifTrue:
		[^ 16384].
	
	(self resolvedName beginsWith: self class gpt5Name) ifTrue: [^ 128000].
	
	(self resolvedName beginsWith: self class o1PreviewName) ifTrue:
		[^ 23768].
	(self resolvedName beginsWith: self class o1MiniName) ifTrue:
		[^ 65536].
	(self resolvedName beginsWith: self class o1Name) ifTrue:
		[^ 100000].
	
	(self resolvedName beginsWith: self class o3Name) ifTrue:
		[^ 100000].
	(self resolvedName beginsWith: self class o4MiniName) ifTrue:
		[^ 100000].
	
	^ self resolvedName caseError