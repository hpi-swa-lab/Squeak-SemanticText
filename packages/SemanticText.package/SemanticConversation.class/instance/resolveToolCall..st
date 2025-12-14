tools
resolveToolCall: aToolCall

	self toolCallResolver ifNotNil: [:block |
		^ block
			cull: aToolCall
			cull: [self basicResolveToolCall: aToolCall]].
	
	^ self basicResolveToolCall: aToolCall