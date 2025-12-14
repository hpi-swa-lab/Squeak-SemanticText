copying
postCopyFrom: original

	super postCopyFrom: original.
	
	contentParts ifNotNil:
		[self contentParts: (self contentParts collect: [:part | part copy])].
	toolCalls ifNotNil:
		[toolCalls := toolCalls collect: [:toolCall | toolCall copy]].
	rawOutput ifNotNil:
		[| copier |
		copier := DeepCopier new: self initialDeepCopierSize.
		copier references at: original put: self.
		rawOutput := rawOutput veryDeepCopyUsing: copier].