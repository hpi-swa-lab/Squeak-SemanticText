accessing
content: contentOrObject

	(contentOrObject isString or: [contentOrObject isText] "or: [contentOrObject isForm]" "not allowed in OpenAI") ifTrue:
		[super content: contentOrObject.
		object := nil.
		^ self].
	
	self content: ([contentOrObject asJsonString] onDNU: #jsonWriteOn: do: [contentOrObject printString]).
	object := contentOrObject.