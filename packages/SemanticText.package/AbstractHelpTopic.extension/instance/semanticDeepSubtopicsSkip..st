*SemanticText-Tools-HelpSystemSearch-accessing
semanticDeepSubtopicsSkip: skipBlock

	| topics |
	topics := Set new.
	self semanticDeepSubtopicsDo: [:topic | topics add: topic] skip: skipBlock.
	^ topics