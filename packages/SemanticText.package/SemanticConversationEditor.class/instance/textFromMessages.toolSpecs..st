private
textFromMessages: messages toolSpecs: toolSpecs

	^ Text streamContents: [:stream |
		messages
			do: [:message |
				| messageAttribute |
				messageAttribute := SemanticConversationEditorMessageAttribute message: message.
				stream withAttribute: messageAttribute do:
					[stream withAttribute: TextEmphasis bold do: "note that bold text is not a decoration but a syntactic instruction for parsing the text!"
						[stream
							nextPutAll: message role capitalized;
							nextPut: $:].
					stream space.
					message isToolMessage
						ifFalse:
							[message content ifNotNil: [:content |
								stream nextPutAll: content]]
						ifTrue:
							[stream nextPutAll: (self textFromToolMessage: message)].
					message toolCalls ifNotEmpty: [:toolCalls |
						message content ifNotNil: [stream cr; cr].
						stream nextPutAll: (self textFromToolCalls: toolCalls)]].
				
				toolSpecs at: message ifPresent: [:toolSpec |
					stream cr; cr.
					stream nextPutAll: (self textFromToolSpec: toolSpec)]]
			separatedBy:
				[stream cr; cr]]