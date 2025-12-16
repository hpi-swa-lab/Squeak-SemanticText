control
startWebSocket

	| pingProcess serverEvents future |
	webSocket := self model account connectWith: [:authorizeBlock |
		WebClient semanticWebSocket13: self serverUrl protocol: nil do: authorizeBlock].
	
	pingProcess := webSocket openAIStartPingPong.
	webSocket onError: [:ex |
		ex pass].
	webSocket onClose:
		[pingProcess terminate.
		webSocket := nil.
		self basicStop].
	
	serverEvents := SharedQueue new.
	webSocket onMessage: [:message |
		serverEvents nextPut: message withoutTrailingBlanks parseAsOrderedJson openAIWithSqueakLineEndings].
	process :=
		[[[| event |
		event := serverEvents next.
		self handleServerEvent: event]
			repeat]
				ifCurtailed: [webSocket ifNotNil: [webSocket close]]]
			forkAt: Processor highIOPriority "stream sounds fluently"
			named: ('{1}' format: {self}).
	
	future := self semanticFutureWhen: #'session.created' until: #stopped..
	[webSocket run]
		forkAt: Processor highIOPriority "stream sounds fluently"
		named: ('{1}''s connection' format: {self}).
	future wait.