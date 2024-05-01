*SemanticTextCompatibility-Squeak60-accessing-override
keyedSubexpressionRanges: key
	"Answer an array of all match ranges (inclusiveStart -> inclusiveStop) of the subexpression at the given key. If a key is defined in multiple groups, sort ranges top-down and left-to-right."

	^ ((keyedMarkerPositions at: key) gather: [:pair |
		(markerPositions at: pair first)
			with: (markerPositions at: pair second)
			collect: [:start :stop | start + 1 to: stop]])
				"Since the same key can be defined for multiple markers, ordering the matches is non-trivial."
				reverse sort: [:range | range start] ascending