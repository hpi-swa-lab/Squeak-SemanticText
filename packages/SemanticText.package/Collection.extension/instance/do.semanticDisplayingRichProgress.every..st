*SemanticText-enumerating
do: aBlock semanticDisplayingRichProgress: aString every: msecs

	| index |
	aString semanticDisplayRichProgressFrom: 1 to: self size updateEvery: msecs during: [:bar |
		index := 0.
		self do: [:ea |
			aBlock value: ea.
			bar value: (index := index + 1)]].