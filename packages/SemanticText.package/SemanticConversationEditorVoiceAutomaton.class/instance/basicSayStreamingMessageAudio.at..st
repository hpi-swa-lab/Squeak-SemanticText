private
basicSayStreamingMessageAudio: aSound at: sampleStart

	self voiceState: #speaking.
	
	aSound samplesRemaining = 0 ifFalse:
		[aSound resumePlaying].
	"[""(aSound duration - (sampleStart / aSound samplingRate))""(aSound samplesRemaining / aSound samplingRate) seconds wait]
		ifCurtailed: [aSound stopGracefully]."
	self waitUntilDone: aSound.