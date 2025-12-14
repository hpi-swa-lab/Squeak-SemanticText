initialize-release
defaultSpeechSynthesisConfig

	^ SemanticSpeechSynthesisConfig new
		voice: self defaultVoiceName;
		yourself