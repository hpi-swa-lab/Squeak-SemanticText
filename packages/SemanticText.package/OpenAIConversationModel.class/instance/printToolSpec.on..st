private - tokens
printToolSpec: aToolSpec on: aStream

	aStream
		nextPutAll: 'namespace functions {'; cr;
		cr.
	aToolSpec tools do: [:tool |
		self assert: tool type = #function.
		self printFunction: tool on: aStream].
	aStream
		cr;
		nextPutAll: '} // namespace functions'.