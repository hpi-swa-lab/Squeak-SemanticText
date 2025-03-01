*SemanticText-Providers-OpenAI-token counting
openAICountTokensOrCompileTo: aStream
	"'We're working on better tooling to expose this, but roughly one hour of audio input equals 128k tokens, the max context window currently supported by this model.'"

	self flag: #approximation. "There is also a separate pricing table for audio tokens but no mapping of minutes to audio tokens."
	^ (128000 * (self duration seconds / 1 hour)) ceiling