accessing
nextToolSpec

	^ toolSpecs at: #next ifAbsent:
		[self toolSpecFor: self lastMessage ifAbsent:
			[nil]]