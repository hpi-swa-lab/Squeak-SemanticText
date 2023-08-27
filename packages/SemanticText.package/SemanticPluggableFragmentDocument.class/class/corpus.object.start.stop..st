instance creation
corpus: aPluggableCorpus object: anObject start: start stop: stop

	^ (self object: anObject start: start stop: stop)
		corpus: aPluggableCorpus;
		yourself