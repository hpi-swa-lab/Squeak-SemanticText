streaming
addChunk: aString

	self flag: #forLater. "Model separately streamable content parts (introduce SemanticContentPart class?). This would closer match the expectations of OpenAI chat completions & realtime API, but so far we did not need it."
	
	self content: (self basicContent ifNil: ['']) asText , aString.
	self triggerEvent: #newChunk with: aString.