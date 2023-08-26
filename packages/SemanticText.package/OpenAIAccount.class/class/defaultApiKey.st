preferences
defaultApiKey
	<preference: 'OpenAI API Key' categoryList: #(SemanticText OpenAI) description: 'See https://platform.openai.com/account/api-keys' type: #String>

	^ (DefaultAccount ifNil: [^ '']) apiKey