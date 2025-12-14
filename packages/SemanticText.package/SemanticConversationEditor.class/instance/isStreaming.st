accessing
isStreaming

	^ self conversation shouldStream ifNil: [false]