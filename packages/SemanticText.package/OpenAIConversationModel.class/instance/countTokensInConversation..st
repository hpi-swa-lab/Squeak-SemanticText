service
countTokensInConversation: aConversation
	"See: https://github.com/openai/openai-cookbook/blob/a74a7a7940928d504f6e9f7300ddef7f47e8659d/examples/How_to_count_tokens_with_tiktoken.ipynb"

	| tokensForHeader tokensPerMessage tokensPerName |
	tokensForHeader := 3.
	tokensPerMessage := 3.
	tokensPerName := 1. "currently not implemented"
	self flag: #todo. "count tokens in tool specs/calls (see https://community.openai.com/t/how-to-calculate-the-tokens-when-using-function-call/266573/27?u=linqlover)"
	^ tokensForHeader
		+ (aConversation messages detectSum: [:message |
			tokensPerMessage +
				(message basicContent
					ifNil: [0]
					ifNotNil: [:content | self countTokensIn: content])])