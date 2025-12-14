constants
defaultModelNames

	self flag: #modelConstants.
	
	"first is default"
	^ {"recommended"
	self tts1Name. "cheapest"
	self gpt4oMiniTtsName. "frontier?"
	self tts1HDName}