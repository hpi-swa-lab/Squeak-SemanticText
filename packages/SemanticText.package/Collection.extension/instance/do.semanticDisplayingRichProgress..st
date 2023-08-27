*SemanticText-enumerating
do: aBlock semanticDisplayingRichProgress: aStringOrBlock

	self flag: #moveUpstream.
	
	^ self do: aBlock semanticDisplayingRichProgress: aStringOrBlock every: 1000

	"
	Smalltalk allClasses 
		do: [:ea | (Delay forMilliseconds: 1) wait]
		semanticDisplayingRichProgress: 'Processing...'
	"