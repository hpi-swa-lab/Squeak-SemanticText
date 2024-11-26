as yet unclassified
storeCodeOn: aStream

	aStream
		nextPutAll: self class name;
		space;
		nextPutAll: #fromSignatureString:;
		space;
		print: self signatureString.
	self action ifNotNil:
		[aStream space.
		self storeActionCodeOn: aStream].