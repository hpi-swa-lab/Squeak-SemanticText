parsing
conversationItemLike: item

	^ item type = 'function_call'
		ifTrue: [self functionCallWithId: item id]
		ifFalse:
			[self assert: (#('message' 'function_call_output') includes: item type).
			self messageWithId: item id]