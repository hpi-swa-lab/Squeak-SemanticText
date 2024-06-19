*SemanticText
semanticToSpeechWithConfigDo: configBlock

	^ SemanticText defaultSpeechSynthesisModel
		getSoundFor: self
		withConfigDo: configBlock