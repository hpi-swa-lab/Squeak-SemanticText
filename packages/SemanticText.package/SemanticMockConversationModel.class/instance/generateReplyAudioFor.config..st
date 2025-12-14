private
generateReplyAudioFor: aConversation config: aConfig

	self assert: (aConfig speechSynthesisConfigOrNil ifNotNil: #voice) = #mockey.
	^ FMSound randomWeird1