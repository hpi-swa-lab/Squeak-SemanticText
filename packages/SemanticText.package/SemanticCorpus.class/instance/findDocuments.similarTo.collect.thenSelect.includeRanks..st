search
findDocuments: number similarTo: documents collect: collectBlock thenSelect: selectBlock includeRanks: includeRanks

	| classifiedDocuments average |
	self flag: #todo. "Maybe do search for each element instead of average?"
	
	classifiedDocuments := (documents reject: [:doc | doc embedding isNil]) asArray.
	classifiedDocuments ifEmpty:
		[^ includeRanks
			ifFalse: [#()]
			ifTrue: [OrderedDictionary new]].
	
	#optimized.
	"embedding := (classifiedDocuments collect: [:doc | doc embedding]) average."
	average := classifiedDocuments first embedding shallowCopy.
	2 to: classifiedDocuments size do: [:i |
		average += (classifiedDocuments at: i) embedding].
	"average /= documents size." "NOT required because ranking of results only depends on vector direction"
	self flag: #todo. "isn't this because the distance only depends on vector direction? shouldn't we normalize the returned ranks?"
	
	^ self
		findDocuments: number
		nearEmbedding: average
		collect: collectBlock
		thenSelect: selectBlock
		includeRanks: includeRanks