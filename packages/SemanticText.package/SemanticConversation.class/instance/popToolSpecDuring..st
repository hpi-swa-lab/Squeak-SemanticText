private
popToolSpecDuring: aBlock

	| result toolSpec |
	toolSpec := toolSpecs removeKey: #next ifAbsent:
		[self toolSpecFor: self lastMessage ifAbsent: [nil]].
	toolSpecs at: #active put: toolSpec.
	result := aBlock ensure:
		[toolSpecs removeKey: #active].
	toolSpec ifNotNil:
		[toolSpecs at: (messages atLast: 1 ifAbsent: [#first]) put: toolSpec].
	^ result