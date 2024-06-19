private
listen

	| sound |
	[self voiceState: #listening.
	
	[self playInterrogativeSound.
	sound := self recordSound]
		ensure:
			[self affirmationSound play].
	
	sound ifNil: [^ self voiceState: nil].
	
	self transcribe: sound]
	
		ifCurtailed:
			[self voiceState: nil].