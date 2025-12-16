parsing
parseStreamedAudioDelta: data addTo: aStreamingMessage part: aSampledSound

	aStreamingMessage addSoundChunk: aSampledSound samples:
		(self model parseAudioSamplesFrom: data soundClass: aSampledSound class).