service
getEmbeddingsForAll: strings config: aConfigOrNil
	"Answer a collection with one embedding for each string. Each embedding vector is a Float32Array of numbers. Each vector is normalized, i.e., has a length very close to 1."

	| embeddingResult |
	embeddingResult := self
		invokeWithConfig: aConfigOrNil
		editInput: [:input |
			input input: strings.
			self flag: #todo. "Use encoding_format=base64 for compacted results? Beware, it's undocumented!"].
	
	^ embeddingResult data collect: [:ea | ea embedding asFloat32Array]