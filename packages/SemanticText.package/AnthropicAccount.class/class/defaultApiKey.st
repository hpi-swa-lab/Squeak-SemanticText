preferences
defaultApiKey
	<preference: 'Anthropic API Key' categoryList: #(SemanticText Anthropic) description: 'See https://console.anthropic.com/settings/keys' type: #String>

	^ (DefaultAccount ifNotNil: [:account | account apiKey]) ifNil: ['']