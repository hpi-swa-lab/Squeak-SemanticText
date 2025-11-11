testing
canGenerateAudio

	self flag: #modelConstants.
	
	^ self name beginsWithAnyOf: {self class gptAudioName. self class gpt4oAudioPreviewName. self class gpt4oMiniAudioPreviewName}