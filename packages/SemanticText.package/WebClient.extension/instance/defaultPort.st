*SemanticText-Providers-OpenAI-initialize-override
defaultPort
	"Return the default port to use if no port was specified.
	Since we only support https and http, default to port 80 unless https."

	^self isSecure
		ifTrue:[443]
		ifFalse:[80]