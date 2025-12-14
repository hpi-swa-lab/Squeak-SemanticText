accessing
upToBlocking
	self flag: #moveUpstream.
	^ Array streamContents: [:stream | | next |
		[next := self nextOrNil] whileNotNil: [stream nextPut: next]]