fileIn/Out
readHeaderFrom: aStream for: aCorpus

	| size |
	size := aStream binary next.
	self text: (aStream ascii next: size).