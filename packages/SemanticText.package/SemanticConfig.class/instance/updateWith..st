copying
updateWith: anotherConfig

	anotherConfig argumentsDo: [:name :value |
		self argumentAt: name put: value].