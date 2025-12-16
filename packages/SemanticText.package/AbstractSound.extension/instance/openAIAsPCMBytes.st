*SemanticText-Providers-OpenAI-converting
openAIAsPCMBytes

	^ ByteArray streamContents: [:bytes |
		[self copy openAIStorePCMSamplesOn: bytes]
			on: ProgressInitiationException do: [:ex |
				ex rearmHandlerDuring:
					[ex resumeSuppressingProgress]]]