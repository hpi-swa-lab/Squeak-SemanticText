*SemanticText-Providers-OpenAI-initialize-override
initializeFromUrl: urlString
	"Initialize the client from a url string"

	| urlStream serverAndPort userAndPass |
	urlStream := urlString readStream.
	scheme := (urlStream upToAll: '://') asLowercase.
	self isSchemeSupported
		ifFalse:[self error: 'Unsupported scheme: ', scheme].
	serverAndPort := urlStream upTo: $/.

	userAndPass := serverAndPort copyUpTo: $@.
	userAndPass = serverAndPort ifFalse:[
		serverAndPort := serverAndPort copyAfter: $@.
		self username: (userAndPass copyUpTo: $:).
		self password: (userAndPass copyAfter: $:).
	].

	self server: serverAndPort.
	self detectProxyServer.