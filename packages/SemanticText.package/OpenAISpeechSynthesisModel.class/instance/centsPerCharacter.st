accessing
centsPerCharacter
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class tts1Name] -> [0.0015s].
		[self class tts1HDName] -> [0.003s]}