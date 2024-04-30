private - tokens
countTokensInMessage: aMessage
	"Approximation! Adopted from https://github.com/hmarr/openai-chat-tokens."

	^ self
		countTokensInMessage: aMessage
		hasMultipleToolMessages: (aMessage conversation messages count: [:ea | ea isToolMessage]) > 1