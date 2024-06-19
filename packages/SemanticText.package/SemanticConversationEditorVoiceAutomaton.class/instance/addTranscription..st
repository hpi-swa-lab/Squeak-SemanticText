private
addTranscription: aString

	self triggerEvent: #conversationRequested.
	
	self conversation addMessage:
		(SemanticMessage role: #user content: aString).
	self flag: #forLater. "make this customizable! do not record this message? allow clients to customize it through config?"
	self conversation addMessage:
		(SemanticMessage role: #system content: 'The above message was transcribed from spoken language. If a word does not make sense, try to guess the correct word from the context. Keep your answer short, usually 1 - 2 sentences. You must answer more than a single word. Provide your answer in the language of the previous user message.').
	
	self emit: [self triggerEvent: #conversationChanged].