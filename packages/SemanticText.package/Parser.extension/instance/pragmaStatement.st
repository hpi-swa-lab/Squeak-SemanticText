*SemanticText-Model-Agents-pragmas-override
pragmaStatement
	"Parse a pragma statement. The leading '<' has already been consumed. The 'here' token is the first one in the pragma. Use that token to dispatch to a custom pragma-parsing method if one can be found with a selector that matches it.
	
	Note that custom pragma parsers need to fulfill two requirements:
		- method selector must match the current token as simple getter,
				e.g., <apicall: ...> matches #apicall or <primitive: ...> matches #primitive
		- method must have pragma <pragmaParser> to be called."
	
	"0) Early exit"
	(hereType = #keyword or: [ hereType = #word or: [ hereType = #binary ] ])
		ifFalse: [  ^ self expected: 'pragma declaration' ].
	
	"1) Do not consider one-word pragmas such as <primitive> and <foobar>. Only keyword pragmas."
	"2) Avoid interning new symbols for made-up pragmas such as #my for <my: 1 pragma: 2>."
	(Symbol lookup: (here last == $: ifTrue: [here allButLast] ifFalse: [here]))
		ifNotNil: [:parserSelector |
			(self class lookupSelector: parserSelector upTo: Parser) ifNotNil: [:parserMethod | "<-- SemanticText: fix for subclasses of Parser (see changeset pragmaParsers-subclasses)"
				"3) Only call methods that claim to be a custom pragma parser via <pragmaParser>."
				(parserMethod hasPragma: #pragmaParser)
					ifTrue: [^ self executeMethod: parserMethod]]].
	
	"X) No custom pragma parser found. Use the default one."
	^ self pragmaStatementKeywords