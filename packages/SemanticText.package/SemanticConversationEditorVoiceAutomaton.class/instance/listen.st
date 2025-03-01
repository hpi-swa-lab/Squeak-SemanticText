private
listen

	| sound |
	["self voiceState: #listening."
	
	[self playInterrogativeSound.
	self voiceState: #listening.
	sound := self recordSound]
		ensure:
			[self playAffirmationSound].
	
	sound ifNil: [^ self voiceState: nil].
	
	self transcribe: sound]
	
		ifCurtailed:
			[self voiceState: nil].