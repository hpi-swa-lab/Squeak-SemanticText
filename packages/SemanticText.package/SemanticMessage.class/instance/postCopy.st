copying
postCopy

	super postCopy.
	
	tokenProbabilities := tokenProbabilities veryDeepCopy.
	rawOutput := rawOutput veryDeepCopy.