*SemanticText-Model-transformations-pseudo-override
adjustLightness: delta

	self flag: #moveUpstream.
	^ Color
		h: self hue
		s: self saturation
		l: (self lightness + delta min: 1.0 max: 0.0)
		alpha: self alpha