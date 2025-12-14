accessing - tool specs
effectiveToolSpecFor: aMessage

	| toolSpec |
	toolSpec := self toolSpecFor: aMessage ifAbsent: [nil].
	^ (self defaultToolSpec ifNil: [^ toolSpec])
		updatedWith: toolSpec