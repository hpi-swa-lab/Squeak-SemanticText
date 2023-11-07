*SemanticTextCompatibility-Squeak60-private-pseudo-override
updateResultText

	resultText := '' asText.
	
	self mutex critical: [
		self writeResultText].
	
	^ resultText