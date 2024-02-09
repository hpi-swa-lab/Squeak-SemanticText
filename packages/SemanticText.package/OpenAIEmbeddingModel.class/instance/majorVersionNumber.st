accessing
majorVersionNumber

	self flag: #modelConstants.
	
	^ self name
		caseOf:
			{[self class embedding3LargeName] -> [3].
			[self class embedding3SmallName] -> [3].
			
			[self class ada002Name] -> [2]}
		otherwise: []