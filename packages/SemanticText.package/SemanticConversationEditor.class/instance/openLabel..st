toolbuilder
openLabel: aStringOrNil

	| window |
	window := aStringOrNil
		ifNil: [ToolBuilder open: self]
		ifNotNil: [ToolBuilder open: self label: aStringOrNil].
	self isStreamingResponse ifFalse:
		[Project current addDeferredUIMessage: [self noteReadyForQuestion]].
	^ window