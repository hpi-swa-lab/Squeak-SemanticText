fileIn/Out
fromFileNamed: filename

	^ StandardFileStream readOnlyFileNamed: filename do: [:stream |
		self fromStream: stream]