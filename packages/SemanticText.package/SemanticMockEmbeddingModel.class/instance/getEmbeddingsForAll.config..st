service
getEmbeddingsForAll: strings config: aConfigOrNil
	"Answer a collection with one embedding for each string. Each embedding vector is an array of numbers, commonly represented as a Float32Array."

	| config |
	config := self baseConfig.
	aConfigOrNil ifNotNil:
		[config := config updatedWith: aConfigOrNil].
	
	^ strings collect: [:string |
		| words |
		words := string substrings collect: [:word | word asLowercaseAlphabetic] as: Bag.
		self keywords
			collect: [:keyword | (words occurrencesOf: keyword) / words size]
			as: Float32Array]