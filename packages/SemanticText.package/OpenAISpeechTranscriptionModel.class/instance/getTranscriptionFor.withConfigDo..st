service
getTranscriptionFor: aSound withConfigDo: configBlock

	^ self
		getTranscriptionFor: aSound
		config:
			(self baseConfig copy
				in: configBlock;
				yourself)