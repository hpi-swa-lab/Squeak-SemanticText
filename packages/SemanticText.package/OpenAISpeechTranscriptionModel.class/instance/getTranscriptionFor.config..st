service
getTranscriptionFor: aSound config: aConfigOrNil

	| soundData result |
	aSound duration seconds < self minLength ifTrue:
		[^ ''].
	
	soundData := ByteArray streamContents: [:stream |
		[aSound storeWAVSamplesOn: stream]
			on: ProgressInitiationException do: [:ex |
				ex rearmHandlerDuring:
					[ex resumeSuppressingProgress]]].
	result := self
		invokeWithConfig: aConfigOrNil
		documents:
			{#file ->
				((MIMEDocument contentType: 'audio/wav' content: soundData)
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