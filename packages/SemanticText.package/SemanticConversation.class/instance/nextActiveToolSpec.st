accessing
nextActiveToolSpec

	| next |
	next := toolSpecs at: #next ifAbsent:
		[self toolSpecFor: self lastMessage ifAbsent:
			[nil]].
	^ (self defaultToolSpec ifNil: [^ next])
		updatedWith: next