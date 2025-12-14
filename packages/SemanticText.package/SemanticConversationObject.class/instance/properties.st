accessing
properties

	^ self basicProperties ifNil: [properties := Dictionary new]