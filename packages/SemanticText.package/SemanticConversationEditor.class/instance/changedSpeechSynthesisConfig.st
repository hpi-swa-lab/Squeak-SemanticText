updating
changedSpeechSynthesisConfig

	self voiceAutomaton shouldSynthesize ifFalse:
		[self voiceAutomaton speechSynthesisConfig: self conversation effectiveConfig speechSynthesisConfigOrNil.
		self conversation updateConfig: [:config |
			config speechSynthesisConfig: self speechSynthesisConfig]].