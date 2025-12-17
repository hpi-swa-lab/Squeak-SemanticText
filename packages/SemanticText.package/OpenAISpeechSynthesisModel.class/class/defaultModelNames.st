constants
defaultModelNames

	self flag: #modelConstants.
	
	"first is default"
	^ {"recommended"
	self tts1Name. "cheapest"
	self gpt4oMiniTtsName. "frontier?"
	self tts1HDName.
	
	"pinned versions, ordered by version ascending, date descending"
	self gpt4oMiniTts20251215Name.
	self gpt4oMiniTts20250320Name}