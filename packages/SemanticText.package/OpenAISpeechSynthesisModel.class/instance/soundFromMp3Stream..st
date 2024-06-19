private
soundFromMp3Stream: aString

	| fileName |
	self flag: #forLater. "support true streaming while receiving data"
	
	fileName := '{1}_tmp_{2}.mp3' format: {self name. UUID new}.
	StandardFileStream newFileNamed: fileName do: [:stream |
		stream nextPutAll: aString].
	
	^ [self soundFromMp3FileNamed: fileName]
		ensure: [FileDirectory default deleteFileNamed: fileName]