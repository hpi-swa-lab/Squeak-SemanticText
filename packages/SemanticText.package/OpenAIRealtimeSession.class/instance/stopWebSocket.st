control
stopWebSocket

	webSocket ifNotNil:
		[webSocket close.
		webSocket := nil].