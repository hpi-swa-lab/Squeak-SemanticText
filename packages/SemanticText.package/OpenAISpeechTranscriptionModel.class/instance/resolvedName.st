accessing
resolvedName

	self flag: #modelConstants.
	^ self name
		caseOf:
			{[self class gpt4oMiniTranscribeName] -> [self class gpt4oMiniTranscribe20250320Name]}
		otherwise: [:originalName | originalName]