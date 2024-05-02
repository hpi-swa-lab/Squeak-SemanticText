private
serializeNumber: aNumber

	^ aNumber isFraction
		ifTrue: ['[{1}:{2}]' format: {aNumber numerator. aNumber denominator}]
		ifFalse: [aNumber asString]