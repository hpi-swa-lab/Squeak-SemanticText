private - configuration
speechTranscriptionConfig

	^ self config speechTranscriptionConfigOrNil
	
	"NB: as we do not reference the speech transcription model in the config but only it's name, accessing it's baseConfig here feels wrong"
	"| effectiveConfig |
	effectiveConfig := self speechTranscriptionModel baseConfig.
	self config speechTranscriptionConfigOrNil ifNotNil: [:config |
		effectiveConfig := effectiveConfig updatedWith: config].
	^ effectiveConfig"