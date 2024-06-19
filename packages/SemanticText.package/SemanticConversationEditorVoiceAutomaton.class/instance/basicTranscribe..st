private
basicTranscribe: aSound

	^ aSound semanticToTextWithConfigDo: [:config |
		config language: self language.
		self flag: #forLater. "possible ideas for better TTS prompting: summarize conversation (only a prefix or suffix of the prompt is considered?); explicitly provide vocabulary through config"
		config prompt:
			((self conversation messages
				select: [:message | #(user assistant) includes: message role]
				thenCollect: #content)
					joinSeparatedBy: String cr)]