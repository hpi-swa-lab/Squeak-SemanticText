*SemanticText-Model-Search-accessing
semanticRandom: aRandom sample: sampleSize
	"Answer an array of <sampleSize> random keys from the receiver, each probabilistically weighted according to its associated value in the receiver."

	| c cdf pdf |
	pdf := self / self sum.
	c := 0.
	cdf := pdf associations collect: [:assoc | (c := c + assoc value) -> assoc key].
	self assert: (c closeTo: 1).
	^ sampleSize timesCollect:
		[| r |
		r := aRandom next.
		(cdf detect: [:assoc | assoc key >= r]) value]