*SemanticText-Model-private-pseudo-override
hueToRGB: p q: q t: t
    | tt |
    tt := t.
    tt < 0.0 ifTrue: [ tt := tt + 1.0 ].
    tt > 1.0 ifTrue: [ tt := tt - 1.0 ].

    tt < (1.0 / 6.0) ifTrue: [ ^ p + ((q - p) * 6.0 * tt) ].
    tt < 0.5           ifTrue: [ ^ q ].
    tt < (2.0 / 3.0) ifTrue: [ ^ p + ((q - p) * (2.0 / 3.0 - tt) * 6.0) ].
    ^ p