accessing
contentWithStyledProbabilities

	| confidentColor unconfidentColor text |
	confidentColor := Color black.
	unconfidentColor := Color white.
	
	text := Text streamContents: [:stream |
		self tokenProbabilities do: [:ea |
			stream
				withAttribute:
					(TextColor color:
						(confidentColor mixed: ea logprob exp with: unconfidentColor))
				do:
					[stream nextPutAll: ea token]]].
	self assert: text asString = self content.
	^ text