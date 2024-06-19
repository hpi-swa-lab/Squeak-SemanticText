accessing
temperature: aNumber
	"Sampling temperature between 0 and 2 (defaults to 1). Controls the randomness and diversity of outputs. A minimal temperatures causes an almost deterministic output, while higher temperatures result in more creativity and hallucinations."

	self argumentAt: #temperature put: aNumber.