*SemanticTextCompatibility-Squeak60-event handling-pseudo-override
dropInspectorField: anInspectorField event: evt
	"Create a self-updating morph that serves as a compact watcher for the dropped inspector field. Answer the new morph."

	| watcher |
	watcher := PluggableButtonMorph new
		changeTableLayout;
		cellPositioning: #topLeft;
		model: [anInspectorField inspector object inspect];
		action: #value;
		yourself.

	watcher
		addMorph: ((UpdatingStringMorph on: anInspectorField selector: #value)
			stepTime: 1000 "msecs";
			yourself);
		addMorph: (('of ', (anInspectorField inspector object printString truncateWithElipsisTo: 40)) asMorph
			font: Preferences standardBalloonHelpFont
			yourself);
		addMorph: (anInspectorField name asString asMorph
			font: Preferences standardBalloonHelpFont
			emphasis: TextEmphasis bold emphasisCode;
			yourself).

	watcher center: evt position.
	watcher bounds: (watcher bounds translatedToBeWithin: self bounds).
	watcher openInWorld.
	^ watcher