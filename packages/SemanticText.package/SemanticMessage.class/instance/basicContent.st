accessing
basicContent
	"The basic textual representation of the content, excluding cursor for streaming messages. Other than #content, this is guaranteed to return a textual representation even for tool messages."

	contentParts ifEmpty:
		[^ nil].
	
	(contentParts anySatisfy: [:part | part isString not]) ifFalse:
		[^ contentParts joinSeparatedBy: String cr].
	
	^ Text streamContents: [:stream |
		contentParts
			do: [:part | part semanticContentPartTextOn: stream]
			separatedBy: [stream cr]]