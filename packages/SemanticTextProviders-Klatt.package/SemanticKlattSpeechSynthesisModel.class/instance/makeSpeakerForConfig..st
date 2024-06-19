private
makeSpeakerForConfig: aConfig
	"Configure the speaker with a buffering voice to avoid playing the sound immediately."

	| speaker |
	speaker := Speaker perform: aConfig voice.
	
	aConfig speed ifNotNil: [:speed |
		speaker speed: speaker speed * speed].
	
	speaker voice: (speaker voice as: SemanticKlattBufferingVoice).
	
	^ speaker