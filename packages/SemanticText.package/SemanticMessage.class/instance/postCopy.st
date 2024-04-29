copying
postCopy

	super postCopy.
	
	content := content copy.
	toolCalls ifNotNil:
		[toolCalls := toolCalls collect: [:toolCall | toolCall copy]].
	tokenProbabilities := tokenProbabilities veryDeepCopy.
	rawOutput := rawOutput veryDeepCopy.