accessing
probability

	^ (self tokenProbabilities collect: [:ea | ea logprob]) average exp