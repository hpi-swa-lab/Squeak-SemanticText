private - text
conversationFromText: aText hasUserEdited: hasUserEdited intervalsDo: intervalsBlockOrNil

	| newConversation newIntervals newMessages newToolSpecs messages toolSpecs intervals nextConversation oldMessages insertedMessages allRunMessages |
	"If we EVER need to touch this again, we should really extract this into a separate class!"
	
	newConversation := self class
		conversationFromText: aText
		isDisplayingRawConversation: self isDisplayingRawConversation
		intervalsDo: [:parsedIntervals | newIntervals := parsedIntervals].
	newMessages := newConversation messages.
	newToolSpecs := newConversation toolSpecs.
	
	newMessages do: [:message | message conversation: self conversation].
	
	"messageIntervalsBlockOrNil ifNotNil: [messageIntervalsBlockOrNil value: newMessageIntervals].
	self flag: #todo. ""this pseudo code version lacks adjustments for #isDisplayingRawConversation and #isDisplayingSystemMessages""
	^ newConversation"
	"Interface convenience: Attempt to prolong the lifecycle of existing messages/tool specs by associating them based on the message attributes (optional)."
	messages := OrderedCollection new.
	toolSpecs := IdentityDictionary new.
	intervals := newIntervals copyEmpty.
	allRunMessages := Set new.
	
	newIntervals keysAndValuesDo: [:newMessageOrToolSpec :interval |
		| runText newToolSpec runToolSpecs runToolSpec runMessages unresolvedTools |
		runText := aText copyFrom: interval start to: interval stop.
		
		newToolSpec := (newMessageOrToolSpec isKindOf: SemanticToolSpec)
			ifTrue: [newMessageOrToolSpec]
			ifFalse: [newToolSpecs at: newMessageOrToolSpec ifAbsent: [nil]].
		runToolSpecs := (runText semanticAllAttributes
			select: [:attribute | attribute isKindOf: SemanticConversationEditorToolSpecAttribute]
			thenCollect: [:attribute | attribute toolSpec])
				withoutDuplicates
					copyWithoutAll: toolSpecs.
		runToolSpec := runToolSpecs
			ifNotEmpty:
				[| toolSpec |
				toolSpec := runToolSpecs first.
				newToolSpec ifNotNil:
					[toolSpec tools:
						(newToolSpec tools collect: [:newTool |
							toolSpec tools
								detect: [:tool | tool isString "robustness for typing" not and: [tool name = newTool name]]
								ifFound: [:tool |
									tool name: newTool name.
									tool description: newTool description.
									tool parameters: newTool parameters.
									tool]
								ifNone: [newTool]])].
				toolSpec forcedTools:
					((newToolSpec ifNotNil: [newToolSpec forcedTools]) ifNotNil: [:forcedTools |
						(forcedTools isCollection and: [forcedTools isSymbol not])
							ifTrue:
								[forcedTools collect: [:newTool |
								toolSpec tools
									detect: [:tool | tool name = newTool name]
									ifNone: [newTool]]]
							ifFalse:
								[forcedTools]]).
				toolSpec]
			ifEmpty: [newToolSpec].
		
		(newMessageOrToolSpec isKindOf: SemanticToolSpec)
			ifTrue:
				[self assert: (toolSpecs includesKey: #default) not.
				toolSpecs at: #default put: runToolSpec.
				intervals at: runToolSpec put: interval]
			ifFalse:
				[| newMessage |
				newMessage := newMessageOrToolSpec.
				runMessages := (runText semanticAllAttributes
					select: [:attribute | attribute isKindOf: SemanticConversationEditorMessageAttribute]
					thenCollect: [:attribute | attribute message])
						withoutDuplicates
							copyWithoutAll: messages.
				allRunMessages addAll: runMessages.
				unresolvedTools := IdentitySet new.
				runMessages := true
					caseOf:
						{[runMessages size = 1] ->
							[| message |
							message := runMessages first.
							newMessage ifNotNil:
								[message role: newMessage role.
								message content = newMessage content ifFalse: "preserve text formatting if string is unchanged"
									[message content: newMessage content].
								self isDisplayingRawConversation ifTrue:
									[message toolCalls:
										(newMessage basicToolCalls ifNotNil: [:newToolCalls |
											newToolCalls collect: [:newToolCall |
												message toolCalls
													detect: [:toolCall |
														toolCall key = newToolCall key
															and: [toolCall key isEmptyOrNil not or: [toolCall asString = newToolCall asString]]]
													ifFound: [:toolCall |
														toolCall key: newToolCall key.
														toolCall tool:
															((newToolCall tool isString and: [toolCall toolName = newToolCall toolName])
																ifTrue: [toolCall tool]
																ifFalse: [newToolCall]).
														toolCall tool isString ifTrue:
															[unresolvedTools add: toolCall].
														toolCall arguments: newToolCall arguments.
														toolCall]
													ifNone: [newToolCall]]])]].
							{message}].
						[self isDisplayingRawConversation not and: [runMessages notEmpty] and: [newMessage role = #assistant]] -> [runMessages]}
					otherwise: [{newMessage"runMessages first"}].
				
				messages addAll: runMessages.
				runToolSpec ifNotNil:
					[toolSpecs atAll: runMessages put: runToolSpec; flag: #hacked].
				intervals atAll: runMessages put: interval; flag: #hacked.
				
				unresolvedTools do: [:toolCall |
					toolSpecs do: [:toolSpec |
						toolSpec toolNamed: toolCall tool ifPresent: [:tool |
							toolCall tool: tool]]]]].
	
	"(toolSpecs values anySatisfy: [:toolSpec | toolSpec tools anySatisfy: [:tool | tool action isNil]]) ifTrue:
		[DateAndTime now in: [:d | ToolSet debugException: (Halt new searchFrom: thisContext)]]."
	
	intervalsBlockOrNil ifNotNil: [intervalsBlockOrNil value: intervals].
	
	"re-insert hidden messages"
	oldMessages := self conversation messages.
	insertedMessages := Dictionary new.
	1 to: oldMessages size do: [:index |
		| oldMessage |
		oldMessage := oldMessages at: index.
		"Could the method have been deleted intentionally by the user, or was it hidden due to the current display settings?"
		((messages includes: oldMessage) not and:
			[(oldMessage isToolMessage and: [self isDisplayingRawConversation not])
				or: [oldMessage role = #system and: [self isDisplayingSystemMessages not]]
				or: [oldMessage role = #assistant and: [self isDisplayingRawConversation not] and: [oldMessage hasToolCalls] and: [hasUserEdited not or: [(oldMessages allButFirst: index) anySatisfy: [:laterMessage | messages includes: laterMessage]]]]])
				ifTrue:
					["Find a previous message that this method relates to"
					| previousMessage |
					((index - 1 to: 1 by: -1)
						detect: [:previousIndex |
							previousMessage := oldMessages at: previousIndex.
							(messages includes: previousMessage)
								and: [oldMessage isToolMessage ==> [previousMessage isToolMessage not]]
								and: [oldMessage role = #assistant ==> [self isMinimalMode or: [previousMessage role = #assistant]]]]
						ifFound: [:previousIndex |
							((oldMessage isToolMessage ==> [((oldMessages copyFrom: previousIndex + 1 to: index - 1) allSatisfy: [:infixMessage | infixMessage isToolMessage]) and: [previousMessage toolCalls includes: oldMessage toolCall]])
								and: [oldMessage role = #assistant ==> [self isMinimalMode or: [(oldMessages copyFrom: previousIndex + 1 to: index - 1) allSatisfy: [:infixMessage | infixMessage isToolMessage or: [infixMessage role = #assistant]]]]])
									ifTrue:
										[oldMessage role = #assistant ifTrue: [previousMessage := (oldMessages copyFrom: previousIndex to: index - 1) reversed detect: [:ea | messages includes: ea]].
										previousMessage]]
						ifNone:
							[(oldMessage isToolMessage or: [oldMessage role = #assistant]) not
								ifTrue: [#beginning]])
						ifNotNil: [:referenceMessage |
							| updatedReference |
							self flag: #hacked. "Can we restore order of invisible messages from attributes of spaces anyway?"
							updatedReference := (referenceMessage = #beginning and: [oldMessage role ~= #system])
								ifTrue: [messages at: 1 ifAbsent: [#beginning]]
								ifFalse: [referenceMessage].
							[insertedMessages
								at: updatedReference
								ifPresent: [:inserted |
									updatedReference := inserted.
									true]
								ifAbsent: [false]] whileTrue.
							updatedReference
								caseOf:
									{[#beginning] -> [messages addFirst: oldMessage].
									[#end] -> [messages addLast: oldMessage]}
								otherwise:
									[messages add: oldMessage after: updatedReference].
							insertedMessages at: updatedReference put: oldMessage.
							self conversation toolSpecFor: oldMessage ifPresent: [:toolSpec |
								toolSpecs at: oldMessage put: toolSpec]]]].
	
	nextConversation := SemanticConversation new
		model: self conversation model;
		config: self conversation config;
		messages: messages;
		toolSpecs: toolSpecs;
		yourself.
	(self isDisplayingRawConversation not and: [nextConversation defaultToolSpec isNil]) ifTrue:
		[self conversation defaultToolSpec ifNotNil: [:defaultToolSpec |
			nextConversation defaultToolSpec: defaultToolSpec]].
	
	^ nextConversation