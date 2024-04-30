tests
testTextFromConversation

	self conversationTextFixtures do: [:fixture |
		| conversation expectedText actualText |
		conversation := fixture first.
		expectedText := fixture third.
		
		actualText := editor textFromConversation: conversation.
		
		self assert: expectedText predicts: actualText].