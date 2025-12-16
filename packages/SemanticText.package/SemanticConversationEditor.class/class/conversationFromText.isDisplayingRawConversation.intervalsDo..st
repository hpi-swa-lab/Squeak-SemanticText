support
conversationFromText: aText isDisplayingRawConversation: isDisplayingRawConversation intervalsDo: intervalsBlockOrNil

	| text steps conversation toolSpecs intervals |
	self flag: #todo. "optimize: very slow for large WideStrings"
	"NB: removes formatting from content parts (e.g., SemanticTokenProbabilityTag)"
	
	text := aText copyReplaceAll: SemanticConversation streamingCursorText with: ''.
	
	steps := Array streamContents: [:stream |
		text runs withStartStopAndValueDo: [:start :stop :attributes |
			((attributes includes: TextEmphasis bold)
				and: [stop - start > 1 and: [(text at: stop) = $:]])
					ifTrue:
						[stream nextPut: {start. stop}]]].
	
	conversation := SemanticConversation new.
	intervals := intervalsBlockOrNil ifNotNil:
		[OrderedDictionary
			hashBlock: [:ea | ea identityHash]
			equalBlock: [:ea :eb | ea == eb]].
	
	steps := steps copyWith: {text size + 1. nil}.
	steps first first > 1 ifTrue:
		[steps := steps copyWithFirst: {1. 1}].
	toolSpecs := IdentityDictionary new.
	steps
		overlappingPairsDo: [:step :nextStep |
			| start sep stop role isRealtimeInstructions content contentText sep2 sep3 toolSpec toolCalls toolKey message |
			start := step first.
			sep := step second.
			stop := nextStep first - 1.
			
			role := (text copyFrom: start to: sep - 1) asString
				ifNotEmpty: [:roleString |
					(roleString endsWith: '(realtime instructions)')
						ifFalse: [roleString asLegalSelector]
						ifTrue:
							[isRealtimeInstructions := true.
							(roleString allButLast: '(realtime instructions)' size) asLegalSelector]]
				ifEmpty: [sep := sep - 1. nil].
			contentText := (text copyFrom: sep + 1 to: stop) withoutLeadingBlanks.
			(contentText size >= 2 and: [(contentText last: 2) = (String cr , String cr)]) ifTrue:
				[contentText := contentText allButLast: 2]. "manual removal of trailing blanks to preserve intended trailing carriage returns during streaming. (in particular when we create an empty contentpart at the beginning for transcriptions)"
			content := contentText isText
				ifTrue: [contentText copy
					removeAttributesThat: [:attribute | ((attribute isKindOf: TextAnchor) or: [(attribute isKindOf: TextInspectIt) and: [attribute target semanticIsSound]]) not];
					in: [:copy |
						copy hasAnyAttribute
							ifTrue: [copy]
							ifFalse: [copy asString]]]
				ifFalse: [contentText].
			content ifNotEmpty:
				[| toolSpecPrefix |
				toolSpecPrefix := isDisplayingRawConversation ifTrue: ['Available tools (force: '] ifFalse: ['Available tools: '].
				(sep2 := content asString findLastOccurrenceOfString: toolSpecPrefix startingAt: 1) > 0 ifTrue:
					[| allItalic |
					allItalic := true.
					(text copyFrom: sep + 1 + sep2 to: stop) semanticWithBlanksTrimmed runs withStartStopAndValueDo: [:start2 :stop2 :attributes2 |
						allItalic := allItalic and: [attributes2 includes: TextEmphasis italic]].
					allItalic ifTrue:
						[| tools |
						toolSpec := content asString allButFirst: sep2 - 1 + toolSpecPrefix size.
						content := (content first: sep2 - 1) semanticWithBlanksTrimmed.
						contentText := (contentText first: sep2 - 1) semanticWithBlanksTrimmed.
						stop := stop - content size + sep2.
						isDisplayingRawConversation
							ifTrue:
								[| forcedTools sep21 toolStream |
								sep21 := (toolSpec findString: '):') - 1.
								forcedTools := toolSpec first: sep21.
								forcedTools := [Object readCarefullyFrom: forcedTools] ifError: [forcedTools].
								toolStream := toolSpec readStream skip: (sep21 + '): ' size clampHigh: toolSpec size); yourself. "robustness for typing"
								tools := OrderedDictionary new.
								[toolStream atEnd] whileFalse:
									[| tool |
									tool := '(?:"(?:\\.|[^"])*"|\\.|[^\r\n])+(?:$|(?!.))' asRegex "single line, excluding linebreaks inside comments"
										matchesStreamPrefix: toolStream;
										subexpression: 1.
									self assert: (toolStream atEnd or: [String crlf includes: toolStream next]).
									tool := [SemanticFunction fromSignatureString: tool] ifError: [tool]. "robustness for typing"
									tools at: tool name put: tool.
									toolStream atEnd ifFalse:
										[(toolStream next: 2) = ', ' ifFalse:
											[toolStream position: toolStream position - 2]]].
								(forcedTools isCollection and: [forcedTools isSymbol not]) ifTrue:
									[forcedTools := forcedTools collect: [:name |
										tools detect: [:tool | tool name = name] ifNone: [name]]].
								toolSpec := SemanticToolSpec new
									tools: tools;
									forcedTools: forcedTools;
									yourself]
							ifFalse:
								[toolSpec := nil]]].
				
				role
					ifNotNil:
						[role = #tool
							ifFalse:
								[| sep33 |
								toolCalls := nil.
								sep3 := 1.
								sep33 := nil.
								[sep3 > 0 and: [(sep3 := content indexOf: $[ startingAt: sep3) > 0]] whileTrue:
									[| sep4 toolCall0 allItalic sep31 |
									sep4 := sep3.
									sep3 := 0.
									toolCall0 := contentText copyFrom: sep4 to: stop - (sep + 1).
									allItalic := true.
									toolCall0 runs withStartStopAndValueDo: [:start2 :stop2 :attributes2 |
										(allItalic := allItalic and: [attributes2 includes: TextEmphasis italic])
											ifTrue: [sep31 := sep4 + stop2 - 1]].
									sep3 := sep31
										ifNotNil:
											[| toolCall |
											toolCall := content asString copyFrom: sep4 to: sep31.
											toolCall first = $[ ifTrue:
												[| sep32 |
												(sep32 := toolCall indexOf: $] startingAt: 2) > 0 ifTrue:
													[sep33 ifNil: [sep33 := sep4].
													isDisplayingRawConversation ifTrue:
														[toolKey := toolCall copyFrom: 2 to: sep32 - 1.
														toolCall := (toolCall allButFirst: sep32) withBlanksTrimmed.
														toolCall := [SemanticToolCall maybeStreamingFromCallString: toolCall] ifError: [nil halt].
														toolCall ifNotNil:
															[toolCall key: toolKey.
															(toolCalls ifNil: [toolCalls := OrderedCollection new])
																addLast: toolCall]]]].
											content indexOfAnyOf: (CharacterSet with: Character cr) complement startingAt: sep31]
										ifNil: [sep4 + 1]].
							sep33 ifNotNil:
								[content := (content take: sep33 - 1) semanticWithBlanksTrimmed]]
						ifTrue:
							[content first = $[ ifTrue:
								[| sep31 |
								(sep31 := content indexOf: $] startingAt: 2) > 0 ifTrue:
									[toolKey := content asString copyFrom: 2 to: sep31 - 1.
									content := (content allButFirst: sep31) semanticWithBlanksTrimmed]]]]].
			
			content ifEmpty: [content := nil].
			
			role
				ifNil:
					[self assert: conversation defaultToolSpec isNil.
					toolSpec ifNotNil:
						[conversation defaultToolSpec: toolSpec.
						
						intervals ifNotNil:
							[intervals at: toolSpec put: (start to: stop)]]]
				ifNotNil:
					[message := role = #tool
						ifFalse: [SemanticMessage role: role content: content]
						ifTrue:
							[SemanticToolMessage
								toolCall: ((conversation toolCallWithKey: toolKey) ifNil: [toolKey])
								content: ([content parseAsOrderedJson] ifError: [content])].
					isRealtimeInstructions = true ifTrue:
						[message isRealtimeInstructions: true].
					toolCalls ifNotNil:
						[message toolCalls: toolCalls].
					
					conversation addMessage: message.
					toolSpec ifNotNil:
						[conversation toolSpecFor: message put: toolSpec].
					
					intervals ifNotNil:
						[intervals at: message put: (start to: stop)]]].
	
	intervalsBlockOrNil ifNotNil: [intervalsBlockOrNil value: intervals].
	^ conversation