service
truncateString: aString minusString: minusString minusWords: minusWords to: maxTokens
	"Truncate aString to maxTokens, reserving additional space for minusString (a String) and minusWords (an Integer) words."

	self flag: #approximation. "Upper approximation! Could use something like OpenAI's tiktoken for more precise counts."
	
	^ aString take: (maxTokens * 2 - minusString size - (minusWords * 10))