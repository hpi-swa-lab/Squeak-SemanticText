updating
changedSpeechSynthesisConfig

	self voiceAutomaton shouldSynthesize ifFalse:
		[self conversation updateConfig: [:config |
			config speechSynthesisConfig: self speechSynthesisConfig]].