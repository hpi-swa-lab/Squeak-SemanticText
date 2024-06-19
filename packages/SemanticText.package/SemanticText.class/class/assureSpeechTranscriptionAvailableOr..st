support
assureSpeechTranscriptionAvailableOr: requirementsBlock

	| model |
	model := self defaultSpeechTranscriptionModelOrNil ifNil:
		[^ requirementsBlock value:
			{{#embeddingModel. 'install a speech transcription model'. [self defaultSpeechTranscriptionModel]}}].
	
	^ model assureAvailableOr: requirementsBlock