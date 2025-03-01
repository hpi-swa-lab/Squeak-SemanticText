private - requests
parseStreamedChunk: chatCompletionChoice toolSpec: aToolSpecOrNil addTo: aStreamingMessage

	| chunkText sound chunkToolCalls chunkTokenProbabilities chunkAudio audioUpdate audioSampleStart |
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
				[sound := SampledSound new.
				chunkText := sound semanticContentPartText.
				audio transcript ifNotNil: [chunkText := chunkText , String cr].
				audioUpdate at: #sound put: [WeakArray with: sound]].
		audio transcript ifNotNil: [:transcript |
			chunkText := chunkText ifNil: [transcript] ifNotNil: [chunkText , transcript].
			audioUpdate at: #transcript put: [aStreamingMessage contentParts second]].
		audio data ifNotNil: [:data |
			chunkAudio := data base64DecodedAs: ByteArray].
		audio at: #'expires_at' ifPresent: [:expirationTime |
			audioUpdate at: #expirationDate put: [DateAndTime fromUnixTime: expirationTime]]].
	
	chunkToolCalls := chatCompletionChoice delta tool_calls ifNotNil: [:toolCalls |
		self parseStreamedToolCallChunksFrom: toolCalls toolSpec: aToolSpecOrNil message: aStreamingMessage].
	
	chunkTokenProbabilities := chatCompletionChoice logprobs ifNotNil: [:logprobs |
		self parseTokenProbabilitiesFrom: logprobs].
	
	chunkAudio ifNotNil:
		["assumes pcm16"
		| initAudio |
		initAudio := sound samples isNil.
		audioSampleStart := initAudio ifTrue: [1] ifFalse: [sound samples size + 1].
		sound openAIAddSamples: (sound class convertBytesTo16BitSamples: chunkAudio mostSignificantByteFirst: false) samplingRate: 24000.
		initAudio ifTrue:
			[sound reset]].
	
	(chunkText isEmptyOrNil and: [chunkToolCalls isNil] and: [chunkTokenProbabilities isEmptyOrNil]) ifFalse:
		[aStreamingMessage addChunk: chunkText toolCalls: chunkToolCalls tokenProbabilities: chunkTokenProbabilities].
	
	audioUpdate ifNotNil:
		[aStreamingMessage propertyValueAt: #audio put:
			((aStreamingMessage propertyValueAt: #audio ifAbsent: [Dictionary new])
				in: [:audio |
					audioUpdate keysAndValuesDo: [:key :valueBlock |
						audio at: key put: valueBlock value]];
				yourself)].
	
	audioSampleStart ifNotNil:
		[aStreamingMessage addedSoundChunk: sound at: audioSampleStart].