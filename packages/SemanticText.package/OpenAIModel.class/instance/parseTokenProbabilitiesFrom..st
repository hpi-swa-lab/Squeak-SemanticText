private
parseTokenProbabilitiesFrom: logprobs

	^ logprobs collect: [:ea |
		SemanticTokenProbabilityTag
			bytes: ea bytes
			logprob: ea logprob
			token: ea token]