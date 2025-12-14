accessing
centsPerOutputAudioToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class gpt4oMiniTtsName] -> [0.0012s]}