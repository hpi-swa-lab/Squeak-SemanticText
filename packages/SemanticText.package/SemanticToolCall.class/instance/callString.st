converting
callString

	^ String streamContents: [:stream |
		self printCallOn: stream]