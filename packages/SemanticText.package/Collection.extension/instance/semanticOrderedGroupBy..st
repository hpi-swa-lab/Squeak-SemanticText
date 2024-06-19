*SemanticText-enumerating
semanticOrderedGroupBy: keyBlock
	"Like in SQL operation - Split the receivers contents into collections of elements for which keyBlock returns the same results, and return them, maintaining the order of the first occurence of each key."

	| result |
	result := OrderedDictionary new.
	self do: [ :each | 
		| key |
		key := keyBlock value: each.
		(result at: key ifAbsentPut: [ OrderedCollection new ]) 
			add: each ].
	^result