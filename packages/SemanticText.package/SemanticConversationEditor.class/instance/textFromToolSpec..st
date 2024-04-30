private - text
textFromToolSpec: aToolSpec

	| tools |
	tools := aToolSpec tools asArray.
	(self isDisplayingRawConversation or: [tools notEmpty]) ifFalse: [^ Text empty].
	^ Text streamContents: [:stream |
		stream
			withAttributes:
				(Array
					with: (SemanticConversationEditorToolSpecAttribute toolSpec: aToolSpec)
					with: TextEmphasis italic
					with:
						(TextInspectIt on: aToolSpec))
			do:
				[| toolsTruncated toolStringBlock |
				stream nextPutAll: 'Available tools'.
				self isDisplayingRawConversation ifTrue:
					[stream
						nextPutAll: ' (force: ';
						nextPutAll:
							(aToolSpec forcedTools ifNotNil: [:forcedTools |
								forcedTools collect: [:tool |
									(tool isString or: [tool isText])
										ifTrue: [tool asString]
										ifFalse: [tool name]]])
								storeString;
						nextPut: $)].
				stream nextPutAll: ': '.
				
				toolsTruncated := 0.
				(self isDisplayingRawConversation not and: [tools size > 4]) ifTrue:
					[toolsTruncated := tools size - 3.
					tools := tools first: 3].
				toolStringBlock := self isDisplayingRawConversation
					ifFalse: [[:object | object isString ifTrue: [object] ifFalse: [object name]]]
					ifTrue: [[:object | object isString ifTrue: [object] ifFalse: [object signatureString]]].
				tools
					do: [:tool |
						stream nextPutAll: (toolStringBlock value: tool).
						self class
							syncContentUpdatesFrom: tool
							stringBlock: toolStringBlock
							to: (WeakArray with: self)]
					separatedBy:
						[self isDisplayingRawConversation
							ifFalse: [stream nextPutAll: ', ']
							ifTrue: [stream cr]].
				toolsTruncated > 0 ifTrue:
					[stream
						nextPutAll: ', ... (';
						print: toolsTruncated;
						nextPutAll: ' more not shown)']]]