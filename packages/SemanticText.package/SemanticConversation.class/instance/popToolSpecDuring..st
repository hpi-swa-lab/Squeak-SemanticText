private
popToolSpecDuring: aBlock

	| message toolSpec result |
	message := messages atLast: 1 ifAbsent: [#start].
	toolSpec := toolSpecs removeKey: #next ifAbsent:
		[self toolSpecFor: self lastMessage ifAbsent: [nil]].
	toolSpecs at: #active put: toolSpec.
	result := aBlock ensure:
		[toolSpecs removeKey: #active ifAbsent: [self flag: #bug "this code path IS hit sometimes. not sure why :("]].
	toolSpec ifNotNil:
		[toolSpecs at: message put: toolSpec].
	^ result