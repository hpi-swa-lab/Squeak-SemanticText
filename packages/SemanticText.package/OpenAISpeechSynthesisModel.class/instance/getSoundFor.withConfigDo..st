service
getSoundFor: aString withConfigDo: configBlock

	^ self
		getSoundFor: aString
		config:
			(self baseConfig copy
				in: configBlock;
				yourself)