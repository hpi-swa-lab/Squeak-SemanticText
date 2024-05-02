*SemanticText-Model-Agents-parse pragma-override
parsePragmaStatement
	"Parse a pragma statement. The leading '<' has already been consumed. The currentToken is the first one in the pragma. Use that token to dispatch to a custom pragma-parsing method if one can be found with a selector that matches it.
	
	Note that custom pragma parsers need to fulfill two requirements:
		- method selector must match the current token as simple getter,
				e.g., <apicall: ...> matches #apicall or <primitive: ...> matches #primitive
		- method must have pragma <pragmaParser> to be called."

	"1) Do not consider one-word pragmas such as <primitive> and <foobar>. Only keyword pragmas."
	currentToken last == $: ifTrue: [
		"2) Avoid interning new symbols for made-up pragmas such as #my for <my: 1 pragma: 2>."
		(Symbol lookup: currentToken allButLast) ifNotNil: [:parserSelector |
			(self class lookupSelector: parserSelector upTo: SHParserST80) ifNotNil: [:parserMethod | "<-- SemanticText: fix for subclasses of Parser (see changeset pragmaParsers-subclasses)"
				"3) Only call methods that claim to be a custom pragma parser via <pragmaParser>."
				(parserMethod hasPragma: #pragmaParser)
					ifTrue: [^ self executeMethod: parserMethod]]]].	

	"X) No custom pragma parser found. Use the default one."
	^ self parsePragmaDefault