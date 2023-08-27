service
countTokensIn: aString
	"Answer the number of tokens that the model will consume when computing the embedding for aString."

	^ aString substrings size