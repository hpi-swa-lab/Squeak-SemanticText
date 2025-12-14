private
synthesize: aMessage

	self shouldSynthesize ifFalse:
		[^ aMessage contentParts detect: #semanticIsSound ifNone: [nil]].
	
	^ self speechSynthesisModel
		getSoundFor: aMessage content
		config: self speechSynthesisConfig