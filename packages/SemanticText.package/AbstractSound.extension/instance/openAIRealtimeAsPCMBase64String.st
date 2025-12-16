*SemanticText-Providers-OpenAI-converting
openAIRealtimeAsPCMBase64String

	| bytes |
	bytes := self openAIAsPCMBytes.
	(bytes anySatisfy: [:byte | byte ~= 0]) ifFalse:
		["zero-only bytes break realtime VAD with an internal server crash"
		^ nil].
	^ String streamContents: [:stream |
		Base64MimeConverter new
			dataStream: bytes readStream;
			multiLine: false;
			mimeStream: stream;
			mimeEncode]