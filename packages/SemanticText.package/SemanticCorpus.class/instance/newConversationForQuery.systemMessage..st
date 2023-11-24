search - conversation
newConversationForQuery: aString systemMessage: systemMessageOrNil
	"Simple retrieval-automated generation (RAG) implementation. See: https://github.com/openai/openai-cookbook/blob/main/examples/Question_answering_using_embeddings.ipynb"

	| similarTexts userMessageTemplate conversation |
	self flag: #forLater. "Improve quality of results:
	* try prompt engineering (different phrases, order of inputs/repetition)
	* better embeddings through chat-generate prompts (ChatGPT functions), fictive answers, or even fictive questions for each document (HyDE)
	* interface: more flexible prompts
	* reference used sources (could assign a number to each document and tell the assistant to return the used numbers)"
	
	similarTexts := self findDocuments: 10 similarToQuery: aString collect: [:document | '```{1}```' format: {document text}].
	userMessageTemplate := 'Answer the search query or question by the user. Use the provided possibly relevant contents for your answer, but check whether they are actually relevant to the user''s question, and ignore any irrelevant contents. Otherwise, in the event that none of the possibly relevant contents is helpful for the query at all, say something like "Sorry, I am unable to answer this question". Do not guess. Do not stray from the topic. Do not define Squeak. Do not provide continuing links.
Keep your answer short (2-3 paragraphs) and easy to scan. The goal is to give a rough overview. Bullet points preferred.


Search query:


```
{1}
```


Possibly relevant contents:


{2}


Answer:'.
	
	conversation := SemanticConversation new.
	conversation config
		shouldStream: true;
		temperature: 0.
	systemMessageOrNil ifNotNil:
		[conversation addSystemMessage: systemMessageOrNil].
	conversation addUserMessage:
		(userMessageTemplate format:
			{aString.
			(self embeddingModel
				truncateString: (similarTexts joinSeparatedBy: String cr, String cr)
				minusString: (systemMessageOrNil ifNil: ['']) , userMessageTemplate
				minusWords: 5
				to: (self maxTokensForConversation clampHigh: conversation model maxPromptTokens))}).
	conversation  getAssistantMessage.
	^ conversation