*SemanticText
semanticToTextWithConfigDo: configBlock

	^ SemanticText defaultSpeechTranscriptionModel
		getTranscriptionFor: self
		withConfigDo: configBlock