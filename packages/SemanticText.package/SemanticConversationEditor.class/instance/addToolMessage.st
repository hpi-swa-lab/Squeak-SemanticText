actions
addToolMessage

	| toolCallMessage toolCalls toolMessages toolCall |
	toolCallMessage := self conversation lastToolCallMessageOrNil.
	toolCallMessage ifNil: [^ self inform: 'No tools were called'].
	toolCalls := toolCallMessage toolCalls.
	
	"find unanswered tool calls"
	toolMessages := (([(self messagesFromText: self editText) values] ifError: [self conversation messages]) copyAfter: toolCallMessage)
		select: [:message | message role = #tool].
	toolCalls := toolCalls reject: [:ea |
		toolMessages anySatisfy: [:toolMessage | toolMessage toolCall key = ea key]].
	toolCalls ifEmpty: [^ self inform: 'No further tools were called'].
	
	toolCall := Project uiManager
		chooseFromLabeledValues:
			(toolCalls
				collect: [:ea | ea callString -> ea]
				as: OrderedDictionary)
		title: 'Choose tool call...'.
	toolCall ifNil: [^ self].
	
	^ self addMessage: toolCall asToolMessage