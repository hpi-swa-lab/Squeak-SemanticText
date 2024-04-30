*SemanticText-Tools-Conversation-accessing
semEnsureEndsWith: aNumber all: anObject

	(0 to: aNumber - 1)
		detect: [:offset |
			collection
				at: position - offset
				ifPresent: [:ea | ea ~= anObject]
				ifAbsent: [false]]
		ifFound: [:offset |
			self next: aNumber - offset put: anObject].