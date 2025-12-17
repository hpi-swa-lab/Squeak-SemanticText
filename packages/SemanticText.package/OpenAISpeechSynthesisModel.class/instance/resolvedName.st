accessing
resolvedName

	self flag: #modelConstants.
	^ self name
		caseOf:
			{[self class gpt4oMiniTtsName] -> [self class gpt4oMiniTts20250320Name]}
		otherwise: [:originalName | originalName]