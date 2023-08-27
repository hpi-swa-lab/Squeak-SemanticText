printing
printOn: aStream

	super printOn: aStream.
	aStream
		space;
		nextPut: $(;
		"nextPutAll: (self text printStringLimitedTo: 80);"
		print: self object;
		space;
		print: start;
		nextPutAll: ' to: ';
		print: stop;
		nextPut: $).