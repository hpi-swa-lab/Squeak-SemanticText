accessing
isStreaming: aBoolean

	self conversation config shouldStream: aBoolean.
	self changed: #isStreaming.