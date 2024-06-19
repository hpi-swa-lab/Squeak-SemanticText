*SemanticText-Tools-menu messages
semanticSpeakToType

	| sound text |
	sound := SampledSound semanticFromUser ifNil: [^ self].
	text := SemanticText defaultSpeechTranscriptionModel getTranscriptionFor: sound.
	
	self
		openTypeIn;
		replace: self selectionInterval with: text asText "and: [self selectAt: self stopIndex]";
		closeTypeIn.