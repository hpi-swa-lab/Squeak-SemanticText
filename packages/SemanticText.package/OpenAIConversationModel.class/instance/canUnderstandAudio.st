testing
canUnderstandAudio

	self flag: #modelConstants.
	
	^ self name beginsWithAnyOf: {self class gpt4oAudioPreviewName. self class gpt4oMiniAudioPreviewName}