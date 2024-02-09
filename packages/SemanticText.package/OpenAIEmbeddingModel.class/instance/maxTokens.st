accessing
maxTokens

	self flag: #modelConstants.
	
	^ self name caseOf:
		{[self class embedding3LargeName] -> [8191].
		[self class embedding3SmallName] -> [8191].
		
		[self class ada002Name] -> [8191]}