initialize-release
defaultConfig

	^ SemanticSpeechSynthesisConfig new
		voice: self defaultVoice;
		yourself