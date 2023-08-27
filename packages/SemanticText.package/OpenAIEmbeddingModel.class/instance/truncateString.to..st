service
truncateString: aString to: maxTokens
	"Truncate aString to maxTokens."

	^ self truncateString: aString minusString: '' minusWords: 0 to: maxTokens