constants
defaultModelNames 

	self flag: #modelConstants.
	
	"first is default"
	^ {"recommended"
	self whisper1Name. "cheapest"
	self gpt4oTranscribeName. "frontier?"
	self gpt4oTranscribeDiarizeName.
	self gpt4oMiniTranscribeName.
	
	"pinned versions, ordered by version ascending, date descending"
	self gpt4oMiniTranscribe20251215Name.
	self gpt4oMiniTranscribe20250320Name}