running
setUp

	super setUp.
	
	self classToBeTested shouldShowWelcomeMessage ifTrue:
		[| old |
		old := self classToBeTested basicShouldShowWelcomeMessage.
		(tearDownActions ifNil: [tearDownActions := OrderedCollection new]) addLast:
			[self classToBeTested basicShouldShowWelcomeMessage: old].
		self classToBeTested shouldShowWelcomeMessage: false].
	
	editor := self classToBeTested new.
	editor conversation model: SemanticMockConversationModel new.
	editor isStreaming: false.