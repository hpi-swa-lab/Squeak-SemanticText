private
messagesAndToolSpecsFromText: aText

	| messages newMessages newToolSpecs newMessagesAndToolSpecs toolSpecs |
	newMessagesAndToolSpecs := self class messagesAndToolSpecsFromText: aText.
	newMessages := newMessagesAndToolSpecs first.
	newToolSpecs := newMessagesAndToolSpecs second.
	
	"^ {newMessages. newToolSpecs}"
	"Interface convenience: Attempt to prolong the lifecycle of existing messages/tool specs by associating them based on the message attributes (optional)."
	messages := OrderedDictionary new.
	toolSpecs := IdentityDictionary new.
	
	newMessages keysAndValuesDo: [:interval :newMessage |
		| runText newToolSpec runToolSpecs runToolSpec runMessages runMessage unresolvedTools |
		runText := aText copyFrom: interval start to: interval stop.
		
		newToolSpec := newToolSpecs at: newMessage ifAbsent: [nil].
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
								detect: [:tool | tool name = newTool name]
								ifFound: [:tool |
									tool name: newTool name.
									tool description: newTool description.
									tool parameters: newTool parameters.
									tool]
								ifNone: [newTool]])].
				toolSpec forcedTools:
					(toolSpec forcedTools ifNotNil: [:forcedTools |
						forcedTools collect: [:newTool |
							toolSpec tools
								detect: [:tool | tool name = newTool name]
								ifNone: [newTool]]]).
				toolSpec]
			ifEmpty: [newToolSpec].
		
		runMessages := (runText semanticAllAttributes
			select: [:attribute | attribute isKindOf: SemanticConversationEditorMessageAttribute]
			thenCollect: [:attribute | attribute message])
				withoutDuplicates
					copyWithoutAll: messages.
		unresolvedTools := IdentitySet new.
		runMessage := runMessages
			ifNotEmpty:
				[| message |
				message := runMessages first.
				message role: newMessage role.
				message content: newMessage content.
				message toolCalls:
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
								ifNone: [newToolCall]]]).
				message]
			ifEmpty:
				[newMessage].
		
		messages at: interval put: runMessage.
		runToolSpec ifNotNil:
			[toolSpecs at: runMessage put: runToolSpec].
		
		unresolvedTools do: [:toolCall |
			toolSpecs do: [:toolSpec |
				toolSpec toolNamed: toolCall tool ifPresent: [:tool |
					toolCall tool: tool]]]].
	
	"(toolSpecs values anySatisfy: [:toolSpec | toolSpec tools anySatisfy: [:tool | tool action isNil]]) ifTrue:
		[DateAndTime now in: [:d | ToolSet debugException: (Halt new searchFrom: thisContext)]]."
	^ {messages. toolSpecs}