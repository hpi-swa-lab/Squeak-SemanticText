updating
updateAdvancedModeAround: updateBlock

	| bounds label builder window |
	window := self containingWindow ifNil: [^ updateBlock value].
	
	"Save current state"
	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	self text: self editText.
	
	updateBlock value.
	
	bounds := ToolBuilder default class getBoundsForWindow: window.
	label := self labelString ifNil: [window label].
	
	"Close first because MVC fiddles around with processes."
	self changed: #close.
	
	builder := ToolBuilder default.
	bounds := bounds withHeight:
		(bounds height
			perform: (self isAdvancedMode ifTrue: [#+] ifFalse: [#-])
			with: self buttonBarHeight + builder windowSpacing).
	
	"Open"
	window := self open.
	"---- In MVC, the lines after this will not be executed ---"
	window openInWorld. "do not attach to hand"
	builder class setBoundsForWindow: window to: bounds.
	
	^ window