private
withToolSpec: aToolSpec do: aBlock

	| previous |
	previous := toolSpecs at: #active ifAbsent: [nil].
	toolSpecs at: #active put: aToolSpec.
	^ aBlock ensure:
		[previous
			ifNil: [toolSpecs removeKey: #active]
			ifNotNil: [toolSpecs at: #active put: previous]]