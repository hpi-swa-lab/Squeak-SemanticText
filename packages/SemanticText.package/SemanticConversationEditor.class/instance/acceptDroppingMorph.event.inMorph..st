updating
acceptDroppingMorph: dropee event: anEvent inMorph: targetMorph 
	
	| externalName reference text |
	(dropee isKindOf: TransferMorph)
		ifTrue:
			[reference := dropee passenger.
			externalName := dropee passenger className]
		ifFalse:
			[reference := dropee.
			externalName := dropee externalName].
	
	"convenience for common cases"
	(reference isKindOf: InspectorField) ifTrue:
		[reference := true
			caseOf:
				{[reference name = 'screenshot' translated and: [reference shouldPrintValueAsIs]] ->
					[Compiler evaluate: reference valueGetterExpression for: reference inspector object].
				[reference name = 'pixels' translated and: [reference shouldPrintValueAsIs]] ->
					[reference inspector object]}
			otherwise: [reference value]].
	(reference isKindOf: Association "hack for explorers because i broken drag'n'drop from inspectors...") ifTrue:
		[reference := reference value].
	reference isMorph ifTrue:
		[reference := reference imageForm].
	
	text := (reference isString or: [reference isText])
		ifTrue: [reference asString]
		ifFalse:
			[(reference respondsTo: #semanticAsContentPart) ifFalse:
				[self inform: 'Cannot add this object to the conversation'.
				^ true].
			reference semanticAsContentPart semanticContentPartText].
	
	self addDo: [text] type: #append.
	^ true