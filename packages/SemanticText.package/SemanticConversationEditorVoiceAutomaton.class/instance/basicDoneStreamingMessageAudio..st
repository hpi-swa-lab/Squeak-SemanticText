private
basicDoneStreamingMessageAudio: aMessage

	| sounds |
	sounds := aMessage contentParts select: #semanticIsSound.
	[[sounds anySatisfy: [:sound | sound samplesRemaining > 0]]
		whileTrue: [0.05 seconds wait]]
			ifCurtailed: [sounds do: #stopGracefully].
	self basicDoneSayingMessage: aMessage.