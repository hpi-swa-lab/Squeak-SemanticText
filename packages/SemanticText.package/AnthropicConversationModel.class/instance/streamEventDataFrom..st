private - network
streamEventDataFrom: aWebResponse
	"Parse server-sent events (SSE) and stream them onto a new generator."

	| responseStream |
	self flag: #moveUpstream. "and add support for named events"
	responseStream := Generator on: [:gen |
		[aWebResponse streamFrom: aWebResponse stream to: gen size: nil progress: nil]
			ensure: [aWebResponse close]].
	
	^ Generator on: [:datasStream |
		[| data |
		data := String streamContents: [:dataStream |
			[responseStream atEnd
				ifFalse:
					[| line |
					line := String streamContents: [:lineStream |
						[responseStream atEnd
							ifFalse:
								[(CharacterSet crlf includes: responseStream peek)
									ifTrue: [responseStream next]
									ifFalse: [lineStream nextPut: responseStream next];
									yourself]
							ifTrue: [true]]
							whileFalse].
					line isEmpty
						ifFalse:
							[Transcript show: line; cr.
							self flag: #todo.
							"(line beginsWith: 'event: ') ifTrue: [
								dataStream nextPutAll: (line allButFirst: 'event: ' size).
								dataStream cr
							]."
							(line beginsWith: 'data: ') ifTrue: [
								dataStream nextPutAll: (line allButFirst: 'data: ' size).
								dataStream cr
							].
						];
						yourself]
				ifTrue: [true]]
					whileFalse].
		data isEmptyOrNil
			ifFalse:
				[datasStream nextPut: data allButLast];
			yourself]
				whileFalse]