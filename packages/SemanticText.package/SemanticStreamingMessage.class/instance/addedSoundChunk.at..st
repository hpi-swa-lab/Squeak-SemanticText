streaming
addedSoundChunk: aSound at: sampleStart

	self triggerEvent: #newSoundChunk withArguments: {aSound. sampleStart}.