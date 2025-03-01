private
synthesize: aMessage

	| model |
	self shouldSynthesize ifFalse:
		[^ aMessage contentParts detect: #semanticIsSound ifNone: [nil]].
	
	model := self speechSynthesisModel.
	^ model
		getSoundFor: aMessage content
		withConfigDo: [:config |
			(model class allVoices includes: self voiceName)
				ifTrue: [config voice: self voiceName].
			config speed: self voiceSpeed]