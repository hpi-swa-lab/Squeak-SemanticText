service
getEmbeddingsForAll: strings config: aConfigOrNil
	"Answer a collection with one embedding for each string. Each embedding vector is an array of numbers, commonly represented as a Float32Array. Each vector is normalized, i.e., has a length very close to 1."

	| config |
	config := self baseConfig.
	aConfigOrNil ifNotNil:
		[config := config updatedWith: aConfigOrNil].
	
	^ strings collect: [:string |
		| words vector |
		words := string substrings collect: [:word | word asLowercaseAlphabetic] as: Bag.
		vector := self keywords
			collect: [:keyword | (words occurrencesOf: keyword) / words size]
			as: Float32Array.
		vector /= vector length]