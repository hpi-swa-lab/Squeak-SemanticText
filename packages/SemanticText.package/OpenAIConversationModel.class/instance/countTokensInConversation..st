service
countTokensInConversation: aConversation
	"See: https://github.com/openai/openai-cookbook/blob/a74a7a7940928d504f6e9f7300ddef7f47e8659d/examples/How_to_count_tokens_with_tiktoken.ipynb"

	| tokensForHeader tokensPerMessage tokensPerName |
	tokensForHeader := 3.
	tokensPerMessage := 3.
	tokensPerName := 1. "currently not implemented"
	^ tokensForHeader
		+ (aConversation messages detectSum: [:message |
			tokensPerMessage + (self countTokensIn: message content)])