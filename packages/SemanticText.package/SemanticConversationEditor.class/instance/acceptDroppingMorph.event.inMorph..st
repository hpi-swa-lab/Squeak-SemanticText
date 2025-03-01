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
	
	"convenience for common case"
	(reference isKindOf: InspectorField) ifTrue:
		[reference := (reference name = 'screenshot' translated and: [reference shouldPrintValueAsIs])
			ifTrue: [Compiler evaluate: reference valueGetterExpression for: reference inspector object]
			ifFalse: [reference value]].
	
	text := (reference isString or: [reference isText])
		ifTrue: [reference asString]
		ifFalse:
			[(reference respondsTo: #semanticAsContentPart) ifFalse:
				[self inform: 'Cannot add this object to the conversation'.
				^ true].
			reference semanticAsContentPart semanticContentPartText].
	
	self addDo: [text].
	^ true