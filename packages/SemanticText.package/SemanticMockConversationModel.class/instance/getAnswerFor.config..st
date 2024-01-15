service
getAnswerFor: aConversation config: aConfigOrNil
	"Generate an assistant reply in response to aConversation. Answer a new SemanticMessage for the new reply. If #shouldStream is set to true, the answer may be SemanticStreamingMessage (depending on the model's capabilities) that is completed in the background."

	^ (self getAnswers: 1 for: aConversation config: aConfigOrNil) first