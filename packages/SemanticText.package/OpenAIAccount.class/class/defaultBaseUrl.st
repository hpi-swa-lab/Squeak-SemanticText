preferences
defaultBaseUrl
	<preference: 'OpenAI API Base URL' categoryList: #(SemanticText OpenAI) description: 'If you are using Microsoft Azure or a proxy of the OpenAI API, you can enter your URL and port here.' type: #String>

	^ (DefaultAccount ifNotNil: [:account | account baseUrl]) ifNil: ['']