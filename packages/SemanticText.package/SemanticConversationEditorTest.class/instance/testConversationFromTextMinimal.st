tests
testConversationFromTextMinimal

	editor mode: #minimal.
	
	self conversationTextFixtures do: [:fixture |
		| expectedConversation text expectedText actualConversation |
		expectedConversation := fixture first.
		text := fixture atPin: 4.
		
		expectedText := editor textFromConversation: expectedConversation. "needs to be before #conversationFromText: send which might manipulate expectedConversation!"
		
		editor conversation: expectedConversation.
		actualConversation := editor conversationFromText: text.
		
		self
			assert: expectedText
			predicts: (editor textFromConversation: actualConversation)].