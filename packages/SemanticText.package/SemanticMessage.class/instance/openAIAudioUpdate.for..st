*SemanticText-Providers-OpenAI-converting
openAIAudioUpdate: openAIContentParts for: audio

	| sound transcript |
	sound := (audio at: #sound) at: 1. "weak reference"
	(sound notNil and: [openAIContentParts includes: sound]) ifFalse:
		[self notify: 'Sound of audio message was modified, sending new message instead'.
		^ nil].
	
	transcript := audio at: #transcript.
	(openAIContentParts includes: transcript) ifFalse:
		[self notify: 'Transcript of audio message was modified, sending new message instead'.
		^ nil].
	
	audio at: #expirationDate ifPresent: [:date |
		date <= DateAndTime now ifTrue:
			[self notify: 'Audio message ID has expired, sending new message instead'.
			^ nil]].
	
	openAIContentParts 
		remove: sound;
		remove: transcript.
	^ [:json |
		json at: #audio put:
			(JsonObject new id: (audio at: #id))]