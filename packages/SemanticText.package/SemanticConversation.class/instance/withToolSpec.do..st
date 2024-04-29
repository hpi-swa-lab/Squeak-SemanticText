tools
withToolSpec: aToolSpec do: aBlock

	| previous |
	previous := toolSpecs at: #active ifAbsent: [nil].
	toolSpecs at: #active put: aToolSpec.
	^ aBlock ensure:
		[toolSpecs removeKey: #active.
		previous ifNotNil: [toolSpecs at: #active put: previous]]