private
generateReplyAudioFor: aConversation config: aConfig

	self assert: aConfig audioVoice = #mockey.
	^ FMSound randomWeird1