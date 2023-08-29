search
findDocuments: number similarTo: documents collect: collectBlock thenSelect: selectBlock

	| classifiedDocuments average |
	classifiedDocuments := (documents reject: [:doc | doc embedding isNil]) asArray.
	classifiedDocuments ifEmpty: [^ #()].
	
	#optimized.
	"embedding := (classifiedDocuments collect: [:doc | doc embedding]) average."
	average := classifiedDocuments first embedding shallowCopy.
	2 to: classifiedDocuments size do: [:i |
		average += (classifiedDocuments at: i) embedding].
	"average /= documents size." "NOT required because ranking of results only depends on vector direction"
	
	^ self
		findDocuments: number
		nearEmbedding: average
		collect: collectBlock
		thenSelect: selectBlock