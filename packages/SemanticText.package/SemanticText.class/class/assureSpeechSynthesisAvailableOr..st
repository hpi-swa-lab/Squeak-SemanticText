support
assureSpeechSynthesisAvailableOr: requirementsBlock

	| model |
	model := self defaultSpeechSynthesisModelOrNil ifNil:
		[^ requirementsBlock value:
			{{#embeddingModel. 'install a speech synthesis model'. [self defaultSpeechSynthesisModel]}}].
	
	^ model assureAvailableOr: requirementsBlock