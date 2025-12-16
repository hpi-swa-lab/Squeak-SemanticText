*SemanticText-Providers-OpenAI-file i/o
openAIStorePCMSamplesOn: aBinaryStream

	| samplesToStore |
	self flag: #moveUpstream.
	samplesToStore := (self duration * self samplingRate) ceiling.
	self storeSampleCount: samplesToStore bigEndian: false on: aBinaryStream.