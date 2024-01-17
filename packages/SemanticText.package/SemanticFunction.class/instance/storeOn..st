printing
storeOn: aStream

	self flag: #deprecate.
	aStream
		nextPut: $(;
		print: self class;
		nextPutAll: ' name: '; print: self name;
		nextPutAll: ' description: '; print: self description.
	self parameters ifNotEmpty:
		[aStream nextPutAll: ' build: [:function | function '.
		self parameters
			do: [:parameter |
				aStream
					nextPutAll: 'addParameter: (';
					store: parameter;
					nextPutAll: ')']
			separatedBy: [aStream nextPutAll: '; '].
		aStream nextPutAll: ']'].
	aStream nextPut: $).