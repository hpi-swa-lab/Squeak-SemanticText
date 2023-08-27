toolbuilder
open

	| window |
	window := ToolBuilder open: self.
	self currentStreamingMessage ifNil:
		[Project current addDeferredUIMessage: [self addUserMessage]].
	^ window