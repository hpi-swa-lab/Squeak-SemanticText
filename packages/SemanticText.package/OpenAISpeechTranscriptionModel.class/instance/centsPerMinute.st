accessing
centsPerMinute
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class whisper1Name] -> [0.6s]}