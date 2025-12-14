actions
addToolMessage

	| newConversation toolCalls toolCall |
	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	
	"find available tools"
	newConversation := [self conversationFromUserText]
		ifError: [self conversation].
	toolCalls := newConversation pendingToolCalls.
	toolCalls ifEmpty: [^ self inform: 'There are no pending tool calls'].
	
	toolCall := toolCalls size = 1
		ifTrue: [toolCalls anyOne]
		ifFalse:
			[Project uiManager
				chooseFromLabeledValues:
					(toolCalls
						collect: [:ea | ea callString -> ea]
						as: OrderedDictionary)
				title: 'Choose tool call...'].
	toolCall ifNil: [^ self].
	
	^ self addMessage: toolCall asToolMessage