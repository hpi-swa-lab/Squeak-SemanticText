private
basicContentTextFromParts: parts

	parts ifEmpty:
		[^ nil].
	
	(parts anySatisfy: [:part | part isString not]) ifFalse:
		[^ parts joinSeparatedBy: String cr].
	
	^ Text streamContents: [:stream |
		parts
			do: [:part | part semanticContentPartTextOn: stream]
			separatedBy: [stream cr]]