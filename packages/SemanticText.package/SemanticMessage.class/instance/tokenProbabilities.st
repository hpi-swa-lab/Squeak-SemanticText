accessing
tokenProbabilities
	"Logarithmic probabilities of generated tokens in the receiver. See SemanticConversationConfig>>shouldLogProbabilities:."

	^ self propertyValueAt: #tokenProbabilities ifAbsent: [nil]