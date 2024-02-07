service
getEmbeddingsForAll: strings config: aConfigOrNil
	"Answer a collection with one embedding for each string. Each embedding vector is a Float32Array of numbers. Each vector is normalized, i.e., has a length very close to 1."

	| useBase64 embeddingResult |
	useBase64 := true. "about twice as fast, no loss of precision due to decimal conversion"
	embeddingResult := self
		invokeWithConfig: aConfigOrNil
		editInput: [:input :config |
			config user ifNotNil: [:user |
				input user: user].
			
			input input: strings.
			useBase64 ifTrue:
				[input encoding_format: #base64]].
	
	^ embeddingResult data collect: [:ea |
		useBase64
			ifFalse: [ea embedding asFloat32Array]
			ifTrue:
				[(Base64MimeConverter mimeDecodeToBytes: ea embedding readStream) contents
					changeClassTo: Float32Array]]