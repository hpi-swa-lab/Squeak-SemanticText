accessing
isStreaming: aBoolean

	self conversation shouldStream: aBoolean.
	self changed: #isStreaming.