private
basicNamed: aString

	^ SemanticText registeredModels detect: [:model | model name = aString]