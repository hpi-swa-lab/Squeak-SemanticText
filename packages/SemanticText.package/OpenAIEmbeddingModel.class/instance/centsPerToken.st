accessing
centsPerToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	self flag: #modelConstants.
	
	^ self name caseOf:
		{[self class embedding3LargeName] -> [0.000013s].
		[self class embedding3SmallName] -> [0.000002s].
		
		[self class ada002Name] -> [0.00001s]}