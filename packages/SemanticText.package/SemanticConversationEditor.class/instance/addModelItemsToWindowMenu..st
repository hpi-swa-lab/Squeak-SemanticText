toolbuilder
addModelItemsToWindowMenu: menu

	super addModelItemsToWindowMenu: menu.
	menu addLine.
	menu defaultTarget: self.
	
	menu
		add: ('choose model... ({1})' format: {self conversation model name})
		action: #chooseModel.
	menu
		add: ('{1}streaming' format: {self isStreaming ifTrue: ['<on>'] ifFalse: ['<off>']})
		action: #toggleStreaming.
	menu
		add: ('{1}voice' format: {self voiceModeEnabled ifTrue: ['<on>'] ifFalse: ['<off>']})
		action: #toggleVoiceMode.
	self voiceAutomaton shouldTranscribe ifTrue:
		[menu
			add: ('choose transcription model... ({1})' format: {self speechTranscriptionModel name})
			action: #chooseSpeechTranscriptionModel].
	self voiceAutomaton shouldSynthesize ifTrue:
		[menu
			add: ('choose speech synthesis model... ({1})' format: {self speechSynthesisModel name})
			action: #chooseSpeechSynthesisModel].
	menu
		add: 'generate code'
		action: #generateCode.
	menu
		add: ('choose voice... ({1})' format: {self voiceName})
		action: #chooseVoice.
	self conversation supportsRealtimeSession ifTrue:
		[menu
			add: ('{1}voice activity detection' format: {self voiceActivityDetectionEnabled semanticAsMarkerString})
			action: #toggleVoiceActivityDetection].
	
	menu
		add: 'inspect conversation'
		action: #inspectConversation.
	menu addLine.
	menu
		add: ('choose default model... ({1})' format: {SemanticText defaultConversationModelOrNil ifNotNil: #name})
		target: SemanticText
		action: #chooseDefaultConversationModel.
	
	(Smalltalk classNamed: #OpenAIAccount) ifNotNil: [:accountClass |
		menu
			add: 'open OpenAI expense watcher'
			target: accountClass
			action: #openExpenseWatcher].
	menu
		add: 'edit preferences'
		action: #openPreferences.
	
	menu addLine.
	SemanticText appMenu: menu.