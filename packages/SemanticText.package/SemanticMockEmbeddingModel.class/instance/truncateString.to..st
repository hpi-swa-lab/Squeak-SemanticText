service
truncateString: aString to: maxTokens
	"Truncate aString to maxTokens."

	"Deliberately naive implementation. Could iterate word-wise and apply binary search."
	| newTruncated truncated |
	newTruncated := (truncated := '').
	aString do: [:character |
		newTruncated := truncated , character.
		(self countTokensIn: newTruncated) > maxTokens ifTrue:
			[^ truncated].
		truncated := newTruncated].
	^ truncated