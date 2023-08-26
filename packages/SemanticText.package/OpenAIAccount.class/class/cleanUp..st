initialize-release
cleanUp: aggressive

	aggressive ifTrue: [
		self allSubInstancesDo: [:account |
			account apiKey: nil].
		self defaultAccount: nil].