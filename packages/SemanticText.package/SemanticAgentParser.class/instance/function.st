pragmas
function
	<pragmaParser>

	| originalComment comment startMark description function signature |
	here = #function: ifFalse: [^ false].
	
	originalComment := currentComment.
	comment := currentComment copy.
	comment ifNotEmpty: [description := comment last].
	currentComment := nil.
	
	signature := String streamContents: [:stream |
		[self advance.
		startMark ifNil: [startMark := hereMark].
		here = #>] whileFalse:
			[stream nextPutAll: here asString.
			currentComment ifNotNil:
				[stream nextPut: $".
				currentComment
					do: [:ea | stream nextPutAll: (ea copyWithRegex: '(?=[\\])' matchesReplacedWith: '\') "escape"]
					separatedBy: [stream nextPutAll: '\"'].
				stream nextPut: $".
				comment := currentComment copy.
				currentComment := nil]]].
	function := [SemanticFunction fromSignatureString: signature] ifError:
		[^ self notify: 'function signature expected' at: startMark + requestorOffset].
	(function description isNil and: [description notNil]) ifTrue:
		[function description: description].
	
	self addPragma: (Pragma keyword: #function: arguments: {function}).
	
	currentComment := originalComment.
	^  true