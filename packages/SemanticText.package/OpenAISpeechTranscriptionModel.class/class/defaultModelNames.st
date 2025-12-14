constants
defaultModelNames

	self flag: #modelConstants.
	
	"first is default"
	^ {"recommended"
	self whisper1Name. "cheapest"
	self gpt4oTranscribeName. "frontier?"
	self gpt4oTranscribeDiarizeName.
	self gpt4oMiniTranscribeName}