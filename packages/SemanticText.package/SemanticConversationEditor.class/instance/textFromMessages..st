private
textFromMessages: messages

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
					stream nextPutAll: message content]]
			separatedBy:
				[stream cr; cr]]