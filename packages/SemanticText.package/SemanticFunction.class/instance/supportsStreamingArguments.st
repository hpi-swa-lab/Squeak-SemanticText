accessing
supportsStreamingArguments
	"Answer whether the receiver can handle streaming arguments before all parameters are available. If true, the receiver might be called with a SemanticStreamingJsonObject that blocks on regular property accesses and provides an additional streaming interface."

	^ self basicSupportsStreamingArguments ifNil:
		["false"
		true "opportunistic testing. lmk if you need a preference for this"]