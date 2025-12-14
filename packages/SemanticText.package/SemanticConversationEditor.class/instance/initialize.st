initialize-release
initialize

	super initialize.
	
	voiceAutomaton := SemanticConversationEditorVoiceAutomaton new
		addDependent: self;
		when: #conversationRequested send: #updateConversationFromText to: self;
		when: #conversationChanged send: #completeAsIs to: self;
		defaultLanguage: self defaultLanguageForSpeech;
		when: #stopRequested send: #voiceModeEnabled: to: self with: false;
		when: #continuousListeningStarted send: #startWatchingConversation to: self;
		when: #continuousListeningStopped send: #stopWatchingConversation to: self;
		yourself.
	
	self conversation: self defaultConversation.
	self mode: self defaultMode.