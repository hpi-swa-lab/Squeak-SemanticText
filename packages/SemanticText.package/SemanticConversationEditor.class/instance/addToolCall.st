actions
addToolCall

	| editText messagesAndToolSpecs toolSpecMessage tools tool newToolCall |
	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	editText := self editText.
	
	"find available tools"
	messagesAndToolSpecs := [self messagesAndToolSpecsFromText: editText]
		ifError: [{self conversation messages. self conversation toolSpecs}].
	toolSpecMessage := (messagesAndToolSpecs first values reject: [:message | message role = #assistant])
		atLast: 1 ifAbsent: [^ self inform: 'No tool specs available'].
	tools := messagesAndToolSpecs second
		at: toolSpecMessage
		ifPresent: [:toolSpec | toolSpec tools]
		ifAbsent: [#()].
	tools ifEmpty: [^ self inform: 'No tools available'].
	
	tool := (Project uiManager
		chooseFromLabeledValues:
			(tools
				collect: [:ea | ea signatureString -> ea]
				as: OrderedDictionary)
		title: 'Choose tool...') value.
	tool ifNil: [^ self].
	
	newToolCall := tool asToolCall
		key: #key;
		yourself.
	^ self addDo: [self textFromToolCall: newToolCall]