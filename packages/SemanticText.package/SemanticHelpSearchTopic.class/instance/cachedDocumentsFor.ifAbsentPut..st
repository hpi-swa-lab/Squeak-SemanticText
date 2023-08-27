searching - semantic
cachedDocumentsFor: topic ifAbsentPut: aBlock

	| key topicContents documents |
	key := topic title.
	(topicContents := topic contents) isEmptyOrNil ifFalse:
		[key := key , String cr , topicContents].
	"Do not use the topic as a key since its life cycle is too short."
	self flag: #debt. "Cache will contain dangling keys when topics are changed. We should have a pruning strategy or proper keys for all topics..."
	(DocumentCache ifNil: [DocumentCache := Dictionary new])
		at: key ifPresent: [:entry |
			^ entry].
	
	documents := aBlock value.
	DocumentCache at: key put: documents.
	^ documents