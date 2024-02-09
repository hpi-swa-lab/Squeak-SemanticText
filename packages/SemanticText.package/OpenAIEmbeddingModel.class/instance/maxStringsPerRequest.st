accessing
maxStringsPerRequest
	"not officially documented, but evidence-based
	https://github.com/openai/openai-python/issues/519#issuecomment-1636921388"

	self flag: #modelConstants.
	
	^ self name caseOf:
		{[self class embedding3LargeName] -> [2048].
		[self class embedding3SmallName] -> [2048].
		
		[self class ada002Name] -> [2048]}