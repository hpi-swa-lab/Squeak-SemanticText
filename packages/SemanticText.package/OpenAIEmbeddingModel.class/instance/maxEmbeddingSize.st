accessing
maxEmbeddingSize

	self flag: #modelConstants.
	
	^ self name caseOf:
		{[self class embedding3LargeName] -> [3072].
		[self class embedding3SmallName] -> [1536].
		
		[self class ada002Name] -> [1536]}