private
invokeWithConfig: aConfigOrNil documents: documentsOrNil editInput: inputBlock handleResponse: responseBlock

	| config input output response |
	config := self baseConfig.
	aConfigOrNil ifNotNil:
		[config := config updatedWith: aConfigOrNil].
	
	input := JsonObject new
		model: self name;
		yourself.
	inputBlock ifNotNil:
		[inputBlock cull: input cull: config].
	config openAIRawConfigOrNil ifNotNil: [:rawConfig |
		rawConfig keysAndValuesDo: [:key :value |
			input at: key put: value]].
	
	self handleTransientServerErrorsDuring:
		[response := self account controlConnectionDuring:
			[| client authorizeBlock |
			client := WebClient new.
			authorizeBlock := [:request |
				self account apiKey ifNotNil: [:apiKey |
					request headerAt: 'Authorization' put: 'Bearer ' , apiKey]].
			documentsOrNil
				ifNil:
					[client
						httpPost: self url
						content: input openAIWithUnixLineEndings asJsonString squeakToUtf8
						type: 'application/json'
						do: authorizeBlock]
				ifNotNil:
					[| inputFields documentFields |
					inputFields := input openAIWithUnixLineEndings associations gather: [:assoc |
						assoc value isArray
							ifFalse:
								[{assoc key squeakToUtf8 -> assoc value squeakToUtf8}]
							ifTrue:
								[assoc value collect: [:ea | assoc key squeakToUtf8 -> ea squeakToUtf8]]].
					documentFields := (documentsOrNil as: OrderedDictionary) associations collect: [:assoc |
						assoc key squeakToUtf8 ->
							(assoc value copy
								in: [:copy |
									copy content isString ifTrue:
										[copy content: assoc value content squeakToUtf8]];
								yourself)].
					client
						openAIHttpPost: self url
						multipartFields: inputFields , documentFields
						do: authorizeBlock]].
	
		output := (responseBlock ifNotNil: [responseBlock cull: response cull: config])
			ifNil: [response content utf8ToSqueak withoutTrailingBlanks parseAsJson openAIWithSqueakLineEndings].
	
		response isSuccess ifFalse:
			[| error |
			error := output at: #error.
			^ OpenAIError
				signalForType: error type
				parameter: error param
				code: error code
				message: error message]].
	
	output usage ifNotNil: [:usage |
		| expense |
		expense := self expenseForUsage: usage.
		self account noteExpense: expense forUser: config user model: self name].
	
	^ output