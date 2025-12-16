private - requests
parseStreamedChunk: chatCompletionChoice toolSpec: aToolSpecOrNil addTo: aStreamingMessage

	| chunkText sound chunkToolCalls chunkTokenProbabilities chunkAudioData audioUpdate |
	aStreamingMessage rawOutput ifNotNil: [:rawOutput |
		rawOutput chatCompletionChunkChoices ifNotNil: [:rawChoices |
			rawChoices addLast: chatCompletionChoice]].
	
	chunkText := chatCompletionChoice delta content.
	
	chatCompletionChoice delta audio ifNotNil: [:audio |
		audioUpdate := Dictionary new.
		audio id ifNotNil: [:id |
			audioUpdate at: #id put: [id]].
		audio transcript ifNotNil: [:transcript |
			self assert: chunkText isNil].
		aStreamingMessage contentParts
			detect: [:part | part semanticIsSound]
			ifFound: [:part | sound := part]
			ifNone:
				[sound := SampledSound samples: #() samplingRate: self audioOutputSamplingRate.
				chunkText := sound semanticContentPartText.
				audio transcript ifNotNil: [chunkText := chunkText , String cr].
				audioUpdate at: #sound put: [WeakArray with: sound]].
		audio transcript ifNotNil: [:transcript |
			chunkText := chunkText ifNil: [transcript] ifNotNil: [chunkText , transcript].
			audioUpdate at: #transcript put: [aStreamingMessage contentParts second]].
		audio data ifNotNil: [:data |
			chunkAudioData := data].
		audio at: #'expires_at' ifPresent: [:expirationTime |
			audioUpdate at: #expirationDate put: [DateAndTime fromUnixTime: expirationTime]]].
	
	chunkToolCalls := chatCompletionChoice delta tool_calls ifNotNil: [:toolCalls |
		self parseStreamedToolCallChunksFrom: toolCalls toolSpec: aToolSpecOrNil message: aStreamingMessage].
	
	chunkTokenProbabilities := chatCompletionChoice logprobs ifNotNil: [:logprobs |
		self parseTokenProbabilitiesFrom: logprobs content].
	
	chunkAudioData ifNotNil:
		[aStreamingMessage addSoundChunk: sound samples:
			(self parseAudioSamplesFrom: chunkAudioData soundClass: sound class)].
	
	(chunkText isEmptyOrNil and: [chunkToolCalls isEmptyOrNil] and: [chunkTokenProbabilities isEmptyOrNil]) ifFalse:
		[aStreamingMessage addChunk: chunkText toolCalls: chunkToolCalls tokenProbabilities: chunkTokenProbabilities].
	
	audioUpdate ifNotNil:
		[aStreamingMessage propertyValueAt: #audio put:
			((aStreamingMessage propertyValueAt: #audio ifAbsent: [Dictionary new])
				in: [:audio |
					audioUpdate keysAndValuesDo: [:key :valueBlock |
						audio at: key put: valueBlock value]];
				yourself)].