private
handleTransientServerErrorsDuring: requestBlock

	| pendingRetries success result |
	pendingRetries := 3.
	success := false.
	[[result := requestBlock value. success := true]
		on: ConnectionClosed , ConnectionTimedOut do: [:ex |
			(pendingRetries := pendingRetries - 1) <= 0 ifTrue: [ex pass].
			Transcript showln: 'retry: ' , ex]
		on: OpenAIError do: [:ex |
			ex code = 503 ifFalse: [ex pass].
			(pendingRetries := pendingRetries - 1) <= 0 ifTrue: [ex pass].
			Transcript showln: 'retry: ' , ex].
	success]
		whileFalse: [success].
	^ result