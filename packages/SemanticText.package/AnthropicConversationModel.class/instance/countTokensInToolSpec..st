private - tokens
countTokensInToolSpec: aToolSpec
	"Approximation! Adopted from https://github.com/forestwanglin/openai-java/blob/main/jtokkit/src/main/java/xyz/felh/openai/jtokkit/utils/ToolContentFormat.java and https://github.com/hmarr/openai-chat-tokens."

	| compiledContent |
	compiledContent := String streamContents: [:stream |
		self printToolSpec: aToolSpec on: stream].
	
	^ (self countTokensIn: compiledContent) + 9