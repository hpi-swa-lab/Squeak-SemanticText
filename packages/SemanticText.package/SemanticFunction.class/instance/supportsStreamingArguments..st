accessing
supportsStreamingArguments: aBoolean
	"Indicate whether the receiver can handle streaming arguments before all parameters are available. If true, the receiver might be called with a SemanticStreamingJsonObject that blocks on regular property accesses and provides an additional streaming interface."

	supportsStreamingArguments := aBoolean.