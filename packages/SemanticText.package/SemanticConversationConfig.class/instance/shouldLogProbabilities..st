accessing
shouldLogProbabilities: aBoolean
	"Whether probabilities of generated replies should be logged in reply messages. See SemanticMessage>>tokenProbabilities."

	self argumentAt: #shouldLogProbabilities put: aBoolean.