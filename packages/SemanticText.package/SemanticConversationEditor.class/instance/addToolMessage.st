actions
addToolMessage

	| editText newConversation toolCallMessage toolCalls toolMessages toolCall |
	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	editText := self editText.
	
	"find available tools"
	newConversation := [self conversationFromUserText: editText]
		ifError: [self conversation].
	toolCallMessage := newConversation lastToolCallMessageOrNil.
	toolCallMessage ifNil: [^ self inform: 'No tools were called'].
	toolCalls := toolCallMessage toolCalls.
	
	"find unanswered tool calls"
	toolMessages := (newConversation messages copyAfter: toolCallMessage)
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