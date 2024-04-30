actions
addToolCall

	| editText newConversation tools tool newToolCall |
	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	editText := self editText.
	
	"find available tools"
	newConversation := [self conversationFromUserText: editText]
		ifError: [self conversation].
	tools := newConversation nextActiveToolSpec
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
	^ self addDo: [self textFromToolCall: newToolCall inConversation: newConversation]