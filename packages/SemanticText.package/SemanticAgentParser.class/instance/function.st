pragmas
function
	<pragmaParser>

	| keyword originalComment comment description signature streamingArguments startMark function |
	here = #function: ifFalse: [^ false].
	keyword := here.
	
	originalComment := currentComment.
	comment := currentComment copy.
	comment isEmptyOrNil ifFalse: [description := comment last].
	currentComment := nil.
	
	signature := String streamContents: [:stream |
		[self advance.
		startMark ifNil: [startMark := hereMark].
		here = 'streamingArguments:' ifTrue:
			[keyword := keyword , here.
			self advance.
			(#('true' 'false' 'nil') includes: here) ifFalse: [^ self expected: 'boolean'].
			streamingArguments := (Scanner new scanTokens: self advance) first].
		here = #>] whileFalse:
			[stream nextPutAll: here asString.
			currentComment ifNotNil:
				[stream nextPut: $".
				currentComment
					do: [:ea | stream nextPutAll: (ea copyWithRegex: '(?=[\\])' matchesReplacedWith: '\') "escape"]
					separatedBy: [stream nextPutAll: '\"']. "quotes in pragma signature are escaped by two quotes, which looks like two comments in a row to the parser"
				stream nextPut: $".
				comment := currentComment copy.
				currentComment := nil]]].
	function := [SemanticFunction fromSignatureString: signature] ifError:
		[^ self notify: 'function signature expected' at: startMark + requestorOffset].
	(function description isNil and: [description notNil]) ifTrue:
		[function description: description].
	function supportsStreamingArguments: streamingArguments.
	
	keyword := keyword asSymbol.
	self addPragma:
		(Pragma keyword: keyword arguments:
			(keyword caseOf:
				{[#function:] -> [{function}].
				[#function:streamingArguments:] -> [{function. streamingArguments}]})).
	 
	
	currentComment := originalComment.
	^  true