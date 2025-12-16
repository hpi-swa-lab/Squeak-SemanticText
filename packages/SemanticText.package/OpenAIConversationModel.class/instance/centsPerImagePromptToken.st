accessing
centsPerImagePromptToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	"GPT Realtime"
	(self resolvedName beginsWith: self class gptRealtimeMiniName) ifTrue: [^ 0.0008s].
	(self resolvedName beginsWith: self class gptRealtimeName) ifTrue: [^ 0.0005s].
	
	^ self name caseError