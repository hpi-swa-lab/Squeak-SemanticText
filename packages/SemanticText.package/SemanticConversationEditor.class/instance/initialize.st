initialize-release
initialize

	super initialize.
	
	voiceAutomaton := SemanticConversationEditorVoiceAutomaton new
		addDependent: self;
		when: #conversationRequested send: #updateConversationFromText to: self;
		when: #conversationChanged send: #completeAsIs to: self;
		language: self defaultLanguageForSpeech;
		yourself.
	
	self conversation: self defaultConversation.
	self mode: self defaultMode.