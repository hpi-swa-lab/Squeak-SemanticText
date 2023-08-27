accessing
isStreaming

	^ self conversation config shouldStream ifNil: [false]