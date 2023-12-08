accessing
maxTokens

	self flag: #modelConstants.
	^ self name caseOf:
		{[self class ada002Name] -> [8191]}