*SemanticText-Providers-OpenAI-testing-pseudo-override
isSchemeSupported

	^ scheme = 'http' or:[scheme = 'https'] or: [scheme = 'ws'] or: [scheme = 'wss']