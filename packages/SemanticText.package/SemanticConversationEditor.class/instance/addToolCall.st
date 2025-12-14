actions
addToolCall

	| newConversation lastUserMessage tools tool newToolCall |
	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	
	"find available tools"
	newConversation := [self conversationFromUserText]
		ifError: [self conversation].
	lastUserMessage := newConversation messages reverse
		detect: [:message | message isAssistantMessage not]
		ifNone: [nil].
	tools := (newConversation effectiveToolSpecFor: lastUserMessage)
		ifNotNil: [:toolSpec | toolSpec tools]
		ifNil: [#()].
	tools ifEmpty: [^ self inform: 'No tools available'].
	
	tool := (Project uiManager
		chooseFromLabeledValues:
			(tools
				collect: [:ea | ea signatureString -> ea]
				as: OrderedDictionary)
		title: 'Choose tool...') value.
	tool ifNil: [^ self].
	
	newToolCall := tool asToolCallWithKey: #key.
	newToolCall conversation: newConversation.
	^ self addDo: [self textFromToolCall: newToolCall inConversation: newConversation]