*SemanticText-Providers-OpenAI-converting
openAIAsWaveBase64String

	^ String streamContents: [:stream |
		Base64MimeConverter new
			dataStream: self openAIAsWaveBytes readStream;
			multiLine: false;
			mimeStream: stream;
			mimeEncode]