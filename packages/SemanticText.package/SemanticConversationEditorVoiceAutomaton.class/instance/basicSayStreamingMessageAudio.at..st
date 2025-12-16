private
basicSayStreamingMessageAudio: aSound at: sampleStart

	self isSpeaking: true.
	
	aSound samplesRemaining = 0 ifFalse:
		[self ensureCanPlayDuring:
			[aSound resumePlaying"]".
			"[""(aSound duration - (sampleStart / aSound samplingRate))""(aSound samplesRemaining / aSound samplingRate) seconds wait]
				ifCurtailed: [aSound stopGracefully]."
			self waitUntilDone: aSound] ].