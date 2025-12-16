accessing
centsPerCachedAudioPromptToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	"GPT Realtime"
	(self resolvedName beginsWith: self class gptRealtimeMiniName) ifTrue: [^ 0.00003s].
	(self resolvedName beginsWith: self class gptRealtimeName) ifTrue: [^ 0.00005s].
	(self resolvedName beginsWith: self class gpt4oMiniRealtimeName) ifTrue: [^ 0.00003s].
	(self resolvedName beginsWith: self class gpt4oRealtimeName) ifTrue: [^ 0.00025s].
	
	^ self name caseError