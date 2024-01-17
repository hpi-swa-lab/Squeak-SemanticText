support
messagesAndToolSpecsFromText: aText

	| text steps messages toolSpecs |
	text := aText copyReplaceAll: SemanticConversation streamingCursorText with: ''.
	
	steps := Array streamContents: [:stream |
		text runs withStartStopAndValueDo: [:start :stop :attributes |
			((attributes includes: TextEmphasis bold)
				and: [stop - start > 1 and: [(text at: stop) = $:]])
					ifTrue:
						[stream nextPut: {start. stop}]]].
	toolSpecs := IdentityDictionary new.
	messages := (((steps copyWith: {text size + 1. nil}))
		overlappingPairsCollect: [:step :nextStep |
			| start sep stop role content sep2 sep3 toolSpec toolCalls toolKey message |
			start := step first.
			sep := step second.
			stop := nextStep first - 1.
			
			role := (text copyFrom: start to: sep - 1)
				asString asLegalSelector.
			content := (text copyFrom: sep + 1 to: stop)
				asString withBlanksTrimmed.
			content ifNotEmpty:
				[(sep2 := content findLastOccurrenceOfString: 'Available tools (force: ' startingAt: 1) > 0 ifTrue:
					[| allItalic |
					allItalic := true.
					(text copyFrom: sep + 1 + sep2 to: stop) withBlanksTrimmed runs withStartStopAndValueDo: [:start2 :stop2 :attributes2 |
						allItalic := allItalic and: [attributes2 includes: TextEmphasis italic]].
					allItalic ifTrue:
						[| forcedTools tools sep21 toolStream |
						toolSpec := content allButFirst: sep2 - 1 + 'Available tools (force: ' size.
						content := (content first: sep2 - 1) withBlanksTrimmed.
						stop := stop - content size + sep2.
						sep21 := (toolSpec findString: '):') - 1.
						forcedTools := toolSpec first: sep21.
						forcedTools := [Object readCarefullyFrom: forcedTools] ifError: [forcedTools].
						toolStream := (toolSpec allButFirst: sep21 + '): ' size) readStream.
						tools := OrderedDictionary new.
						[toolStream atEnd] whileFalse:
							[| tool |
							tool := [SemanticFunction fromSignatureString: toolStream]
								ifError: [toolStream contents].
							tools at: tool name put: tool.
							toolStream atEnd ifFalse:
								[(toolStream next: 2) = ', ' ifFalse:
									[toolStream position: toolStream position - 2]]].
						forcedTools ifNotNil:
							[forcedTools := forcedTools collect: [:name |
								tools detect: [:tool | tool name = name] ifNone: [name]]].
						toolSpec := SemanticToolSpec new
							tools: tools;
							forcedTools: forcedTools;
							yourself]].
				
				role = #tool
					ifFalse:
						[| sep33 |
						toolCalls := nil.
						sep3 := 1.
						sep33 := nil.
						[sep3 > 0 and: [(sep3 := content indexOf: $[ startingAt: sep3) > 0]] whileTrue:
							[| sep4 allItalic sep31 |
							sep4 := sep + 1 + sep3.
							sep3 := 0.
							allItalic := true.
							(text copyFrom: sep4 to: stop) withBlanksTrimmed runs withStartStopAndValueDo: [:start2 :stop2 :attributes2 |
								(allItalic := allItalic and: [attributes2 includes: TextEmphasis italic])
									ifTrue: [sep31 := sep4 - sep - 1 + stop2 - 1]].
							sep31 ifNotNil:
								[| toolCall |
								toolCall := content copyFrom: sep4 - sep - 1 to: sep31.
								toolCall first = $[ ifTrue:
									[| sep32 |
									(sep32 := toolCall indexOf: $] startingAt: 2) > 0 ifTrue:
										[sep33 ifNil: [sep33 := sep4 - sep - 1].
										toolKey := toolCall copyFrom: 2 to: sep32 - 1.
										toolCall := (toolCall allButFirst: sep32) withBlanksTrimmed.
										toolCall := [SemanticToolCall fromCallString: toolCall] ifError: [nil].
										toolCall ifNotNil:
											[toolCall key: toolKey.
											(toolCalls ifNil: [toolCalls := OrderedCollection new])
												addLast: toolCall]]].
								sep3 := content indexOfAnyOf: (CharacterSet with: Character cr) complement startingAt: sep31]].
					sep33 ifNotNil:
						[content := content take: sep33 - 1]]
				ifTrue:
					[content first = $[ ifTrue:
						[| sep31 |
						(sep31 := content indexOf: $] startingAt: 2) > 0 ifTrue:
							[toolKey := content copyFrom: 2 to: sep31 - 1.
							content := (content allButFirst: sep31) withBlanksTrimmed]]]].
			
			content ifEmpty: [content := nil].
			
			message := role = #tool
				ifFalse: [SemanticMessage role: role content: content]
				ifTrue:
					[SemanticToolMessage toolCall: toolKey content: ([content parseAsJson] ifError: [content])].
			toolSpec ifNotNil:
				[toolSpecs at: message put: toolSpec].
			toolCalls ifNotNil:
				[message toolCalls: toolCalls].
			
			(start to: stop) -> message])
		as: OrderedDictionary.
	^ {messages. toolSpecs}