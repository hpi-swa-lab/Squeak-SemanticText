private
distanceBetween: embedding and: anotherEmbedding
	"cosine distance"

	| abs otherAbs |
	anotherEmbedding ifNil: [^ Float infinity].
	
	abs := embedding squaredLength.
	abs = 0 ifTrue: [^ Float infinity].
	otherAbs := anotherEmbedding squaredLength.
	otherAbs = 0 ifTrue: [^ Float infinity].
	^ 1.0 -
		(
			(embedding dot: anotherEmbedding)
		/
			(
				abs
			*
				otherAbs
			) sqrt
		)