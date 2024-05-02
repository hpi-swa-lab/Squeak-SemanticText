search - ranking
rankObjects: objects forQuery: queryOrNil take: anInteger

	| localDocuments queryEmbedding |
	queryOrNil ifNil: [^ self rankObjects: objects sampleForQuery: nil take: anInteger].
	
	anInteger = 0 ifTrue: [^ #()].
	objects ifEmpty: [^ objects].
	
	localDocuments := Dictionary new: objects size.
	self documents do: [:document |
		(objects includes: document object) ifTrue:
			[localDocuments at: document object put: document]].
	queryEmbedding := self getEmbeddingFor: queryOrNil.
	
	^ ((localDocuments sorted: [:document | document embedding dot: queryEmbedding] descending)
		take: anInteger)
			collect: [:document | document object]