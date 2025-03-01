accessing
tokenProbabilities: aCollection
	"Logarithmic probabilities of generated tokens in the receiver. See SemanticConversationConfig>>shouldLogProbabilities:."

	self propertyValueAt: #tokenProbabilities put: aCollection.