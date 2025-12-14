private
basicTranscribe: aSound

	^ self speechTranscriptionModel
		getTranscriptionFor: aSound
		config:
			(self speechTranscriptionConfig copy in: [:config |
				self flag: #forLater. "possible ideas for better TTS prompting: summarize conversation (only a prefix or suffix of the prompt is considered?); explicitly provide vocabulary through config"
				config prompt ifNil:
					[config prompt:
						((self conversation messages
							select: [:message | #(user assistant) includes: message role]
							thenCollect: #content)
								joinSeparatedBy: String cr)]])