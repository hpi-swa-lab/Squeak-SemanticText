fileIn/Out
readHeaderFrom: aStream
	"may be overridden by subclasses"

	| metadata |
	metadata := Json readFrom: aStream.
	self loadMetadataFrom: metadata.
	metadata ifNotEmpty:
		[self notify: 'unknown metadata'].
	
	self assert: aStream next = Character cr.