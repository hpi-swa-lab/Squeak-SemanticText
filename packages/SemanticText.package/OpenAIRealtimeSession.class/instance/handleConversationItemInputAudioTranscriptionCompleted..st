server events - conversation items
handleConversationItemInputAudioTranscriptionCompleted: event
	<serverEvent: #'conversation.item.input_audio_transcription.completed'>

	| message contentPart |
	message := self messageWithId: event item_id.
	self logEvent: event forItem: message..
	
	event usage ifNotNil: [:usage |
		| expense |
		expense := self speechTranscriptionModel expenseForUsage: usage.
		self model assignExpense: expense toMessages: {message}.
		self model account
			noteExpense: expense
			forUser: self config user
			model: self speechTranscriptionModel name].
	
	contentPart := message contentParts at: event content_index + 1.
	self assert: contentPart semanticIsSound.
	
	self assert: (message contentParts at: event content_index + 2) = event transcript.
	
	message beComplete.