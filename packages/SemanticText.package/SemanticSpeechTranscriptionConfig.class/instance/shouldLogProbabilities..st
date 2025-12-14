accessing
shouldLogProbabilities: aBoolean
	"Whether probabilities of generated replies should be logged in transcriptions. See SemanticTokenProbabilityTag."

	self argumentAt: #shouldLogProbabilities put: aBoolean.