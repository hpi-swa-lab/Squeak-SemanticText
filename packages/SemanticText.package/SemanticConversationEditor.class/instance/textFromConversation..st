private - text
textFromConversation: aConversation

	^ Text streamContents: [:stream |
		| needsMessageSeparator previousPrintedMessage |
		needsMessageSeparator := false.
		
		self isMinimalMode ifFalse:
			[aConversation defaultToolSpec ifNotNil: [:toolSpec |
				| toolSpecText |
				toolSpecText := self textFromToolSpec: toolSpec.
				toolSpecText ifNotEmpty:
					[stream nextPutAll: toolSpecText.
					needsMessageSeparator := true]]].
		
		previousPrintedMessage := nil.
		aConversation messages do: [:message |
			| displayMessage displayAsNewMessage messageAttribute |
			displayMessage := message role = #system ==> [self isDisplayingSystemMessages]
				and: [(self isMinimalMode and: [message role = #assistant]) ==> [message content isEmptyOrNil not or: [message == aConversation messages last "to avoid disappearing assistant message while calling tool"]]]
				and: [message isToolMessage ==> [self isDisplayingRawConversation]].
			displayAsNewMessage := displayMessage and:
				[self isDisplayingRawConversation not ==> [(message role = #assistant and: [previousPrintedMessage notNil] and: [previousPrintedMessage role = #assistant]) not]].
			needsMessageSeparator ifTrue:
				[(displayAsNewMessage or: [displayMessage and: [message content isEmptyOrNil not]])
					ifTrue:
						[stream cr; cr.
						needsMessageSeparator := false]
					ifFalse:
						[(displayMessage and: [message basicContent isEmptyOrNil not]) ifTrue:
							[stream ensureASpace]]].
			messageAttribute := SemanticConversationEditorMessageAttribute message: message.
			stream withAttribute: messageAttribute do:
				[displayMessage ifTrue:
					[displayAsNewMessage ifTrue:
						[needsMessageSeparator := true.
						stream withAttribute: TextEmphasis bold do: "note that bold text is not a decoration but a syntactic instruction for parsing the text!"
							[stream
								nextPutAll: message role capitalized;
								nextPut: $:].
						stream space].
					message isToolMessage
						ifFalse:
							[message content ifNotNil: [:content |
								needsMessageSeparator := needsMessageSeparator or: content notEmpty.
								self flag: #todo. "commit Text>>#putOn:"
								content putOn: stream]]
						ifTrue:
							[stream nextPutAll: (self textFromToolMessage: message).
							needsMessageSeparator := true].
					previousPrintedMessage := message.
					self isDisplayingRawConversation ifTrue: [needsMessageSeparator := true]].
				self isMinimalMode ifFalse:
					[message toolCalls ifNotEmpty: [:toolCalls |
						needsMessageSeparator ifTrue:
							[stream semEnsureEndsWith: 2 all: Character cr].
						stream nextPutAll: (self textFromToolCalls: toolCalls inConversation: aConversation)]]].
			
			self isMinimalMode ifFalse:
				[aConversation toolSpecFor: message ifPresent: [:toolSpec |
					stream cr; cr.
					stream nextPutAll: (self textFromToolSpec: toolSpec)]]]]