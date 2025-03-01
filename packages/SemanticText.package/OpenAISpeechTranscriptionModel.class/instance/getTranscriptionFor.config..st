service
getTranscriptionFor: aSound config: aConfigOrNil

	| result |
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
				input prompt: temperature]].
	
	^ result text