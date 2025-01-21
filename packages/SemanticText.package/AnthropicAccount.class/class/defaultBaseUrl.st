preferences
defaultBaseUrl
	<preference: 'Anthropic API Base URL' categoryList: #(SemanticText Anthropic) description: 'If you are using AWS Bedrock, GCP Vertex or a proxy of the Anthropic API, you can enter your URL and port here.' type: #String>

	^ (DefaultAccount ifNotNil: [:account | account baseUrl]) ifNil: ['']