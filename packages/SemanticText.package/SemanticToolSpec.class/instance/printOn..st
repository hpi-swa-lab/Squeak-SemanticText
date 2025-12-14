printing
printOn: aStream

	super printOn: aStream.
	
	aStream nextPut: $(.
	aStream nextPutAll: 'tools: '.
	self tools keys
		do: [:name | aStream nextPutAll: name]
		separatedBy: [aStream space].
	aStream nextPut: $).