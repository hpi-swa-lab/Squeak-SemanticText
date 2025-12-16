client events - private
addConfig: aConfig toResponse: json

	(aConfig speechSynthesisConfigOrNil ifNotNil: [:synthesisConfig | synthesisConfig voice]) ifNotNil: [:voice |
		json audio: (JsonObject new
			output: (JsonObject new
				voice: voice))].
	
	aConfig maxTokens ifNotNil: [:maxTokens |
		json max_output_tokens:
			(maxTokens = Float infinity ifTrue: ['inf'] ifFalse: [maxTokens])].
	
	aConfig outputModalities ifNotNil: [:modalities |
		json output_modalities:
			((modalities includes: #audio) ifTrue: [modalities copyWithout: #text] ifFalse: [modalities])].