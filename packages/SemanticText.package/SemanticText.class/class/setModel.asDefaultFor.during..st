registry - generic
setModel: aModel asDefaultFor: type during: aBlock

	| previous |
	previous := self defaultModelOrNilFor: type.
	self defaultModels at: type put: aModel.
	^ aBlock ensure:
		[self defaultModels at: type put: previous]