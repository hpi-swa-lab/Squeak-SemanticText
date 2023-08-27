accessing
name: aString

	name := aString.
	
	self embeddingSize:
		(name
			caseOf: {[self class ada002Name] -> [1536]}
			otherwise: []).