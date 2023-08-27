fileIn/Out
writePositionOn: aStream

	aStream binary.
	aStream
		nextInt32Put: start;
		nextInt32Put: stop.