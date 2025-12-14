private
annotateText: aStringOrText withLogprobs: logprobs

	^ SemanticTokenProbabilityTag
		annotateText: aStringOrText
		withProbabilities: (self parseTokenProbabilitiesFrom: logprobs)