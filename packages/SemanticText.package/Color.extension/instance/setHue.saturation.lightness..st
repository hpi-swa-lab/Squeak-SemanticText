*SemanticText-Model-private-pseudo-override
setHue: hue saturation: saturation lightness: lightness
    "Initialize this color to the given hue, saturation, and lightness (HSL)."

    | s l hf p q |
    s := (saturation asFloat max: 0.0) min: 1.0.
    l := (lightness asFloat max: 0.0) min: 1.0.

    "zero saturation yields gray with the given lightness"
    s = 0.0 ifTrue: [ ^ self setRed: l green: l blue: l ].

    hf := hue asFloat.
    (hf < 0.0 or: [hf >= 360.0])
        ifTrue: [ hf := hf \\ 360 ].
    hf := hf / 360.0.

    q := l < 0.5
        ifTrue: [ l * (1.0 + s) ]
        ifFalse: [ l + s - (l * s) ].
    p := 2.0 * l - q.

    ^ self
        setRed: (self hueToRGB: p q: q t: hf + (1.0 / 3.0))
        green: (self hueToRGB: p q: q t: hf)
        blue: (self hueToRGB: p q: q t: hf - (1.0 / 3.0))