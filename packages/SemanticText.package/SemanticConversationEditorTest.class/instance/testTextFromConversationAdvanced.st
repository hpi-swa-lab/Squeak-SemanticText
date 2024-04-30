tests
testTextFromConversationAdvanced

	editor mode: #advanced.
	
	self conversationTextFixtures do: [:fixture |
		| conversation expectedText actualText |
		conversation := fixture first.
		expectedText := fixture second.
		
		actualText := editor textFromConversation: conversation.
		
		self assert: expectedText predicts: actualText].