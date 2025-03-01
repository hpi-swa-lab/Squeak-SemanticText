copying
postCopy

	super postCopy.
	
	contentParts ifNotNil:
		[contentParts := contentParts collect: [:part | part copy]].
	toolCalls ifNotNil:
		[toolCalls := toolCalls collect: [:toolCall | toolCall copy]].
	rawOutput := rawOutput veryDeepCopy.
	properties ifNotNil:
		[properties := properties collect: [:value | value veryDeepCopy]].