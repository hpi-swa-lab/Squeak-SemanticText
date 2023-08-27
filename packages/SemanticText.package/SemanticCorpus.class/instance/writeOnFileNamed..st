fileIn/Out
writeOnFileNamed: filename

	FileStream newFileNamed: filename do: [:stream |
		self writeOn: stream].