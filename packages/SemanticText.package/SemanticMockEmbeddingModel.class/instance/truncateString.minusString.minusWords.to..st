service
truncateString: aString minusString: minusString minusWords: minusWords to: maxTokens
	"Truncate aString to maxTokens, reserving additional space for minusString (a String) and minusWords (an Integer) words."

	^ self truncateString: aString to:
		(maxTokens - (self countTokensIn: minusString) - minusWords)