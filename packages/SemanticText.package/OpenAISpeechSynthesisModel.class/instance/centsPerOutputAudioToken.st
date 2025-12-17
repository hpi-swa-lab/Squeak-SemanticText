accessing
centsPerOutputAudioToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	(self resolvedName beginsWith: self class gpt4oMiniTtsName) ifTrue: [^ 0.0012s].
	
	^ self name caseError