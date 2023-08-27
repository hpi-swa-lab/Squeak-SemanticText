*SemanticText-Model-testing class hierarchy
semanticIncludesBehaviorNamed: aString

	^ self withAllSuperclasses anySatisfy: [:class | class name = aString]