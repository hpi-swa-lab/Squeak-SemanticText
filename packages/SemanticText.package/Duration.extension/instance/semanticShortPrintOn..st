*SemanticText-printing
semanticShortPrintOn: aStream

	"Format as: [-][[D:]HH:]MM:SS"
	| d h m s |
	self flag: #moveUpstream.
	
	d := self days abs.
	h := self hours abs.
	m := self minutes abs.
 	s := self seconds abs truncated.
	self negative ifTrue: [ aStream nextPut: $- ].
	d > 0 ifTrue:
		[d printOn: aStream. aStream nextPut: $:].
	d + h > 0 ifTrue:
		[h < 10 ifTrue: [ aStream nextPut: $0. ].
		h printOn: aStream. aStream nextPut: $:].
	m < 10 ifTrue: [ aStream nextPut: $0. ].
	m printOn: aStream. aStream nextPut: $:.
	s < 10 ifTrue: [ aStream nextPut: $0. ].
	s printOn: aStream.