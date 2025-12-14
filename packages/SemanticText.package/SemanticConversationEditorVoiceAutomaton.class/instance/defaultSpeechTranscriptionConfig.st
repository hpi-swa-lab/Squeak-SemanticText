initialize-release
defaultSpeechTranscriptionConfig

	^ SemanticSpeechTranscriptionConfig new
		language: self defaultLanguage;
		yourself