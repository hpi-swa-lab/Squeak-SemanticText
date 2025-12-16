private - requests
parseAudioSamplesFrom: data soundClass: soundClass
	"Assumes pcm16"

	^ soundClass
		convertBytesTo16BitSamples: data semanticBase64DecodedAsByteArray
		mostSignificantByteFirst: false