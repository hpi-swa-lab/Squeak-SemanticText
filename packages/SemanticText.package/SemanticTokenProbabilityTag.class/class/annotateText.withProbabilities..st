support
annotateText: aStringOrText withProbabilities: tokenProbabilities

	| index text |
	text := aStringOrText asText.
	index := 0.
	tokenProbabilities do: [:attribute |
		text
			addAttribute: attribute
			from: (index := index + 1)
			to: (index := index + attribute token size - 1)].
	self assert: index = text size.
	^ text