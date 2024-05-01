*SemanticText-accessing-pseudo-override
atAll: keys put: anObject

	keys do: [:key | self at: key put: anObject].
	^ anObject