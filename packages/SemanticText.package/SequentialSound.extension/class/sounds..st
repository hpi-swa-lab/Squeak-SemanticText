*SemanticText-Providers-OpenAI-instance creation-pseudo-override
sounds: sounds

	self flag: #moveUpstream.
	^ self new
		setSounds: sounds asArray;
		yourself