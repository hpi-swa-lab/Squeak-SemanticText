accessing
shouldSynthesize

	^ self basicShouldSynthesize ifNil:
		[((self conversation ifNil: [^ self defaultShouldSynthesize])
			model ifNil: [^ self defaultShouldSynthesize])
				canGenerateAudio not]