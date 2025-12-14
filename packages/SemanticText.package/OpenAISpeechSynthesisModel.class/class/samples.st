documentation
samples

	^ Samples ifNil: [Samples :=
		({OpenAISpeechSynthesisModel tts1HDName.
		OpenAISpeechSynthesisModel gpt4oMiniTtsName}
			semanticConcurrentCollect: [:n |
				| model |
				model := SemanticText speechSynthesisModelNamed: n.
				n ->
					(model allVoices semanticConcurrentCollect: [:v |
						v ->
							(model
								getSoundFor: 'The quick brown fox jumps over the lazy dog. Et voilà!'
								withConfigDo: [:c | c voice: v])])
							as: Dictionary])
				as: Dictionary]