accessing
content: anObjectOrString

	anObjectOrString isString ifTrue:
		[super content: anObjectOrString.
		object := nil.
		^ self].
	
	content := [anObjectOrString asJsonString] onDNU: #jsonWriteOn: do: [anObjectOrString printString].
	object := anObjectOrString.