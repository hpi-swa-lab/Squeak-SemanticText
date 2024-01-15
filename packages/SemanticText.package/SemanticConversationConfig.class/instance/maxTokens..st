accessing
maxTokens: aNumber
	"The maximum number of tokens in the output. Note that models cannot reflect on this parameter - further output will be truncated, and you may need to additionally instruct the model for brevity."

	self argumentAt: #maxTokens put: aNumber.