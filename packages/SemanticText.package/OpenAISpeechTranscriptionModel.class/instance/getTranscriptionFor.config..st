service
getTranscriptionFor: aSound config: aConfigOrNil

	| result shouldLogProbabilities transcription |
	aSound duration seconds < self minLength ifTrue:
		[^ ''].
	
	result := self
		invokeWithConfig: aConfigOrNil
		documents:
			{#file ->
				((MIMEDocument contentType: 'audio/wav' content: aSound openAIAsWaveBytes)
					setField: 'Content-Disposition' toString: 'form-data; filename=audio.wav';
					privateUrl: 'file:audio.wav' asUrl;
					yourself)}
		editInput: [:input :config |
			config language ifNotNil: [:language |
				input language: language].
			config prompt ifNotNil: [:prompt |
				input prompt: prompt].
			config temperature ifNotNil: [:temperature |
				input prompt: temperature].
			input include:
				(Array streamContents: [:stream |
					(shouldLogProbabilities := config shouldLogProbabilities ifNil: [false]) ifTrue:
						[stream nextPut: 'logprobs']]).
			input response_format: 'json'].
	
	transcription := result text.
	shouldLogProbabilities ifFalse:
		[^ transcription "string"].
	
	self flag: #forLater. "parse segments, language, words"
	
	self flag: #bug. "The API does not report the logprobs."
	^ self annotateText: transcription withLogprobs: result logprobs