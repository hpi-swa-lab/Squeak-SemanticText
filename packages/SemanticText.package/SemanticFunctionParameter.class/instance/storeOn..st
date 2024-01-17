printing
storeOn: aStream

	aStream
		nextPut: $(;
		print: self class;
		nextPutAll: ' name: '; print: self name;
		nextPutAll: ' description: '; print: self description;
		nextPutAll: ' type: '; print: self type;
		nextPutAll: ' required: '; print: self required;
		nextPut: $).