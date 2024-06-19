toolbuilder
openLabel: aStringOrNil

	| window |
	window := aStringOrNil
		ifNil: [ToolBuilder open: self]
		ifNotNil: [ToolBuilder open: self label: aStringOrNil].
	self currentStreamingMessage ifNil:
		[Project current addDeferredUIMessage: [self noteReadyForQuestion]].
	^ window