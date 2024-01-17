copying
postCopy

	super postCopy.
	
	content := content copy.
	toolCalls := toolCalls copy.
	tokenProbabilities := tokenProbabilities veryDeepCopy.
	rawOutput := rawOutput veryDeepCopy.