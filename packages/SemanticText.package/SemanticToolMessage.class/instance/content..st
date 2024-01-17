accessing
content: anObjectOrString

	anObjectOrString isString ifTrue:
		[super content: anObjectOrString.
		object := nil.
		^ self].
	
	content := anObjectOrString asJsonString.
	object := anObjectOrString.