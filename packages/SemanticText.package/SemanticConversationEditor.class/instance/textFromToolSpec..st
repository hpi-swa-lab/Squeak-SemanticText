private
textFromToolSpec: aToolSpec

	^ Text streamContents: [:stream |
		stream
			withAttributes:
				(Array
					with: (SemanticConversationEditorToolSpecAttribute toolSpec: aToolSpec)
					with: TextEmphasis italic
					with:
						(TextInspectIt on: aToolSpec))
			do:
				[stream
					nextPutAll: 'Available tools (force: ';
					nextPutAll:
						(aToolSpec forcedTools ifNotNil: [:tools |
							tools collect: [:tool |
								(tool isString or: [tool isText])
									ifTrue: [tool asString]
									ifFalse: [tool name]]])
							storeString;
					nextPutAll: '): '.
				aToolSpec tools asArray
					do: [:tool |
						stream nextPutAll: tool signatureString.
						self class
							syncContentUpdatesFrom: tool
							stringBlock: [:object | object signatureString]
							to: (WeakArray with: self)]
					separatedBy: [stream cr]]]