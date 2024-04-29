service
countTokensInConversation: aConversation
	"Note: (Upper) approximation! Token counts are approximated (see #countTokensIn:), and the precise tokens generated for tool specs, tool calls, and tool messages are unknown and have been reverse-engineered but not been comprehensively tested.
	Adopted from https://github.com/forestwanglin/openai-java/blob/main/jtokkit/src/main/java/xyz/felh/openai/jtokkit/utils/ToolContentFormat.java and https://github.com/hmarr/openai-chat-tokens."

	| tools pendingTools toolMessages hasMultipleToolMessages tokens |
	tools := aConversation activeToolSpec ifNotNil: [:toolSpec | toolSpec tools].
	pendingTools := tools.
	toolMessages := aConversation messages select: [:message | message role = #tool].
	hasMultipleToolMessages := toolMessages size > 1.
	tokens := aConversation messages detectSum: [:message |
		| compiledContent |
		compiledContent := message basicContent ifNil: [''].
		(pendingTools isEmptyOrNil not and: [message role = #system]) ifTrue:
			[compiledContent := compiledContent , String cr.
			pendingTools := nil].
		self
			countTokensInMessage:
				(message shallowCopy
					content: compiledContent;
					yourself)
			hasMultipleToolMessages: hasMultipleToolMessages].
	
	tools isEmptyOrNil ifFalse:
		[tokens := tokens + (self countTokensInToolSpec: aConversation activeToolSpec).
		
		(aConversation messages anySatisfy: [:message | message role = #system])
			ifTrue:
				["'Tools typically add a system message, but reuse the first one if it's already there. This offsets the extra 9 tokens added by the tool definitions.'"
				tokens := tokens - 4]].
	
	hasMultipleToolMessages ifTrue:
		[| toolMessagesWithContentCount |
		tokens := tokens + (toolMessages size * 2 + 1).
		(toolMessagesWithContentCount := toolMessages count: [:message | message contentString isEmptyOrNil not]) > 0 ifTrue:
			[tokens := tokens + 1 - toolMessagesWithContentCount]].
	
	(aConversation activeToolSpec ifNotNil: [:toolSpec | toolSpec forcedTools]) ifNotNil: [:forcedTools |
		tokens := tokens +
			(forcedTools
				ifEmpty: [1]
				ifNotEmpty:
					[forcedTools detectSum: [:tool |
						| toolName |
						toolName := (tool isString or: [tool isText])
							ifTrue: [tool asString]
							ifFalse: [tool asOpenAIToolChoiceObject name].
						(self countTokensIn: toolName) + 4]])].
	
	^ tokens