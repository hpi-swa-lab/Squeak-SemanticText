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
					with: TextEmphasis italic)
			do:
				[| toolsTruncated toolStringBlock |
				stream withAttribute: (TextInspectIt on: aToolSpec) do:
					[stream nextPutAll: 'Available tools'.
					self isDisplayingRawConversation ifTrue:
						[stream
							nextPutAll: ' (force: ';
							nextPutAll:
								((aToolSpec forcedTools isCollection and: [aToolSpec forcedTools isSymbol not])
									ifTrue:
										 [aToolSpec forcedTools collect: [:tool |
												(tool isString or: [tool isText])
													ifTrue: [tool asString]
													ifFalse: [tool name]]]
									ifFalse:
										[aToolSpec forcedTools])
									storeString;
							nextPut: $)].
					stream nextPutAll: ':'].
				stream nextPutAll: ' '.
				
				toolsTruncated := 0.
				(self isDisplayingRawConversation not and: [tools size > 4]) ifTrue:
					[toolsTruncated := tools size - 3.
					tools := tools first: 3].
				toolStringBlock := self isDisplayingRawConversation
					ifFalse: [[:object | object isString ifTrue: [object] ifFalse: [object name]]]
					ifTrue: [[:object | object isString ifTrue: [object] ifFalse: [object signatureString]]].
				tools
					do: [:tool |
						stream withAttribute: (TextInspectIt on: tool) do:
							[stream nextPutAll: (toolStringBlock value: tool).
							self class
								syncContentUpdatesFrom: tool
								stringBlock: toolStringBlock
								to: (WeakArray with: self)]]
					separatedBy:
						[self isDisplayingRawConversation
							ifFalse: [stream nextPutAll: ', ']
							ifTrue: [stream cr]].
				toolsTruncated > 0 ifTrue:
					[stream
						nextPutAll: ', ... (';
						print: toolsTruncated;
						nextPutAll: ' more not shown)']]]