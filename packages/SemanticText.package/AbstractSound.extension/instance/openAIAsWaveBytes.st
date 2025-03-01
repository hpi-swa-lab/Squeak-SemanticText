*SemanticText-Providers-OpenAI-converting
openAIAsWaveBytes

	^ ByteArray streamContents: [:bytes |
		[self storeWAVSamplesOn: bytes]
			on: ProgressInitiationException do: [:ex |
				ex rearmHandlerDuring:
					[ex resumeSuppressingProgress]]]