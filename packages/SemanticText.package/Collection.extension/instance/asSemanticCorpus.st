*SemanticText-Model-Search
asSemanticCorpus
	"Create, answer, and initialize a SemanticCorpus with all elements of the receiver as documents. Assumes all elements are strings or texts."

	| corpus |
	corpus := SemanticSimpleCorpus new.
	self do: [:ea |
		corpus addDocument: (SemanticSimpleDocument forText: ea)].
	
	corpus estimatePriceToInitializeEmbeddings in: [:amount |
		(amount notNil and: [amount maxCents >= 1]) ifTrue: 
			[self notify: ('About to spend {1} for a semantic corpus' format: {amount})]].
	corpus updateEmbeddings.
	
	^ corpus

	"data := #('dutch' 'densk' 'belgian' 'german' 'english' 'japanese' 'klingonic' 'JavaScript' 'Python' 'CPython' 'Smalltalk').
	corpus := data asSemanticCorpus.
	corpus rankObjects: data sampleForQuery: 'dutch' take: data size."