search - ranking
rankObjects: objects sampleForQuery: queryOrNil diverse: diverse take: anInteger

	| diversities localDocuments queryEmbedding relevances sample scores |
	anInteger = 0 ifTrue: [^ #()].
	objects ifEmpty: [^ objects].
	
	queryOrNil ifNotNil:
		[queryEmbedding := self getEmbeddingFor: queryOrNil].
	
	localDocuments := Dictionary new: objects size.
	self documents do: [:doc |
		(objects includes: doc object) ifTrue:
			[localDocuments at: doc object put: doc]].
	
	diverse ifTrue:
		[diversities := localDocuments
			collect: [:doc |
				(localDocuments collect: [:otherDoc | doc embedding dot: otherDoc embedding])
					average]
			as: Dictionary.
		diversities := diversities / diversities sum].
	
	queryEmbedding ifNotNil:
		[relevances := documents
			collect: [:doc | doc -> ((doc embedding dot: queryEmbedding) ** 5)]
			as: Dictionary.
		relevances := relevances / relevances sum].
	
	scores := relevances
		ifNil:
			[diversities ifNil: [objects]]
		ifNotNil:
			[diversities
				ifNil: [relevances]
				ifNotNil:
					["relevances + diversities"
					objects
						collect: [:object |
							object ->
								((relevances at: object) + (diversities at: object))]
						as: Dictionary]].
	
	sample := scores semanticRandomSample: anInteger * 10.
	sample := (sample copyWithout: nil) withoutDuplicates.
	^ sample take: anInteger