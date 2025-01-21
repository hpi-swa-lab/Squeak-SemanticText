*SemanticText-Providers-Anthropic-accessing
anthropicRawConfig
	"Parameters that are directly added to the Anthropic model request. This will override any conflicting other properties of the config."

	^ self argumentAt: #anthropicRawConfig ifAbsentPut: [JsonObject new]