*SemanticText-Providers-OpenAI-accessing
openAIRawConfig
	"Parameters that are directly added to the OpenAI model request. This will override any conflicting other properties of the config."

	^ self argumentAt: #openAIRawConfig ifAbsentPut: [JsonObject new]