actions
complete: aText

	| response |
	self conversation model assureAvailableOr: [:requirements |
		(Project uiManager
			chooseOptionFromLabeledValues: 
				((requirements
					collect: [:requirement | requirement second -> requirement]
					as: OrderedDictionary)
						at: #cancel put: nil;
						yourself)
			title: 'To enable conversations, you need to configure SemanticText first.')
				ifNotNil: [:requirement | requirement third value].
		^ false].
	
	aText ifNotNil:
		[self text: aText].
	
	response := self beBusyDuring:
		[self conversation getAssistantMessage].
	
	response isStreaming
		ifFalse:
			[self changed: #text.
			self addUserMessage]
		ifTrue:
			[self updateStreamingMessage].