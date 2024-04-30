tests
testConversationFromTextAdvanced

	editor mode: #advanced.
	
	self conversationTextFixtures do: [:fixture |
		| expectedConversation text expectedText actualConversation |
		expectedConversation := fixture first.
		text := fixture second.
		
		expectedText := editor textFromConversation: expectedConversation. "needs to be before #conversationFromText: send which might manipulate expectedConversation!"
		
		editor conversation: editor defaultConversation.
		actualConversation := editor conversationFromText: text.
		
		self
			assert: expectedText
			predicts: (editor textFromConversation: actualConversation).
		
		editor conversation: expectedConversation.
		actualConversation := editor conversationFromText: text.
		
		self
			assert: expectedText
			predicts: (editor textFromConversation: actualConversation)].