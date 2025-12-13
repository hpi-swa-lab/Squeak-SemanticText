accessing
centsPerAudioPromptToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	"GPT Audio"
	(self resolvedName beginsWith: self class gptAudioMiniName) ifTrue: [^ 0.001s].
	(self resolvedName beginsWith: self class gptAudioName) ifTrue: [^ 0.0032s].
	
	"GPT-4o"
	(self resolvedName beginsWith: self class gpt4oMiniAudioPreviewName) ifTrue: [^ 0.001s].
	(self resolvedName beginsWith: self class gpt4oAudioPreviewName) ifTrue: [^ 0.004s].
	
	^ self name caseError