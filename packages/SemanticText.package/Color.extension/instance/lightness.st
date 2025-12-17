*SemanticText-Model-accessing-pseudo-override
lightness

	| max min |
	max := ((self privateRed max: self privateGreen) max: self privateBlue) asFloat.
	min := ((self privateRed min: self privateGreen) min: self privateBlue) asFloat.
	^ max + min / (2.0 * ComponentMax)