*SemanticText-Providers-Mocks-accessing
mockConfig
	"Parameters that are only relevant for mocking models."

	^ self argumentAt: #mockConfig ifAbsentPut: [JsonObject new]