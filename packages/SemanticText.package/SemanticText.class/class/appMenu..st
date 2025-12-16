app - menu
appMenu: menu

	menu addItem: [:item |
		item
			contents: 'default models';
			addSubMenu: [:subMenu |
				subMenu
					add: ('default conversation model... ({1})' format: {self defaultConversationModelOrNil ifNotNil: #name})
					target: self
					action: #chooseDefaultConversationModel.
				subMenu
					add: ('default embedding model... ({1})' format: {self defaultEmbeddingModelOrNil ifNotNil: #name})
					target: self
					action: #chooseDefaultEmbeddingModel.
				subMenu
					add: ('default speech transcription model... ({1})' format: {self defaultSpeechTranscriptionModelOrNil ifNotNil: #name})
					target: self
					action: #chooseDefaultSpeechTranscriptionModel.
				subMenu
					add: ('default speech synthesis model... ({1})' format: {self defaultSpeechSynthesisModelOrNil ifNotNil: #name})
					target: self
					action: #chooseDefaultSpeechSynthesisModel]].
	menu
		add: 'edit preferences'
		action: #openPreferences.
	menu add: 'show help' target: self action: #showHelp.
	
	menu addLine.
	
	menu
		add: 'send feedback...' target: self action: #sendFeedback;
		balloonTextForLastItem: 'make the author happy by giving him some feedback'.
	menu
		add: 'self-update' target: self action: #doSelfUpdate;
		balloonTextForLastItem: ('download and install the latest updates for {1}' format: {self appName}).
	
	^ menu