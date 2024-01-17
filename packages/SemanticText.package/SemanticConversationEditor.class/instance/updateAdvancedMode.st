updating
updateAdvancedMode

	| currentBounds label window |
	"Save current state"
	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	self text: self editText.
	self containingWindow in: [:oldWindow |
		oldWindow ifNil: [^ self].
		
		currentBounds := ToolBuilder default class getBoundsForWindow: oldWindow.
		label := self labelString ifNil: [oldWindow label]].
	
	"Close first because MVC fiddles around with processes."
	self changed: #close.
	
	"Open"
	window := self open.
	"---- In MVC, the lines after this will not be executed ---"
	window openInWorld. "do not attach to hand"
	ToolBuilder default class setBoundsForWindow: window to: currentBounds.
	
	^ window