*SemanticText-Providers-OpenAI-converting
openAIAsDataUrl

	^ String streamContents: [:stream |
		stream nextPutAll: 'data:image/png;base64,'.
		Base64MimeConverter new
			dataStream:
				(ByteArray streamContents: [:bytes |
					PNGReadWriter putForm: self onStream: bytes])
						readStream;
			multiLine: false;
			mimeStream: stream;
			mimeEncode]