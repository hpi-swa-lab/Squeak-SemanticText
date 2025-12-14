scanning
emphasizeScanner: scanner

	| defaultColor |
	defaultColor := (scanner respondsTo: #semanticTextColor) ifTrue: [scanner semanticTextColor] ifFalse: [Color black].
	"scanner textColor: (Color lightGray mixed: self probability with: defaultColor)."
	scanner textColor: (defaultColor adjustLightness: ((1 - self probability) * 0.3 + 0.5) - defaultColor lightness).