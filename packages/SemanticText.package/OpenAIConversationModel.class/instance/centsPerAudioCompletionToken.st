accessing
centsPerAudioCompletionToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	"GPT Realtime"
	(self resolvedName beginsWith: self class gptRealtimeMiniName) ifTrue: [^ 0.002s].
	(self resolvedName beginsWith: self class gptRealtimeName) ifTrue: [^ 0.0064s].
	(self resolvedName beginsWith: self class gpt4oMiniRealtimeName) ifTrue: [^ 0.002s].
	(self resolvedName beginsWith: self class gpt4oRealtimeName) ifTrue: [^ 0.008s].
	
	"GPT Audio"
	(self resolvedName beginsWith: self class gptAudioMiniName) ifTrue: [^ 0.002s].
	(self resolvedName beginsWith: self class gptAudioName) ifTrue: [^ 0.0064s].
	
	"GPT-4o"
	(self resolvedName beginsWith: self class gpt4oMiniAudioPreviewName) ifTrue: [^ 0.002s].
	(self resolvedName beginsWith: self class gpt4oAudioPreviewName) ifTrue: [^ 0.008s].
	
	^ self name caseError