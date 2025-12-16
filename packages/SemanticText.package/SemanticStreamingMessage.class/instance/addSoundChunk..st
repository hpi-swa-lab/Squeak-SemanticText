streaming
addSoundChunk: samples

	^ self
		addSoundChunk: (self contentParts detect: [:part | part semanticIsSound])
		samples: samples