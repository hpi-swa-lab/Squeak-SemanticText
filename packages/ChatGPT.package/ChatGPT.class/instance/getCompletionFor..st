completing
getCompletionFor: aConversation

	| contentIn contentOut response result |
	contentIn := JsonObject new
		model: self model;
		yourself.
	self temperature ifNotNil:
		[contentIn temperature: self temperature].
	contentIn messages:
		(aConversation messages collect: [:message |
			JsonObject new
				role: message role;
				content: message content;
				yourself]).
	
	response := WebClient new
		httpPost: 'https://api.openai.com/v1/chat/completions'
		content: contentIn asJsonString squeakToUtf8
		type: 'application/json'
		do: [:request |
			request headerAt: 'Authorization' put: 'Bearer ' , self key].
	contentOut := response content utf8ToSqueak parseAsJson.
	
	response isSuccess ifFalse:
		[| error |
		error := contentOut at: #error.
		^ ChatGPTError
			signalForType: error type
			parameter: error param
			code: error code
			message: error message].
	
	result := contentOut choices first message.
	^ ChatGPTMessage role: result role content: result content