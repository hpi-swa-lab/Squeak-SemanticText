accessing
shouldLogProbabilities: aBoolean
	"Whether probabilities of generated replies should be logged. See SemanticMessage>>#tokenProbabilities."

	self argumentAt: #shouldLogProbabilities put: aBoolean.