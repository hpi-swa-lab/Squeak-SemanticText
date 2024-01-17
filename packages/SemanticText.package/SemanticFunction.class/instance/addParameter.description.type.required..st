accessing
addParameter: name description: description type: type required: aBoolean

	^ self addParameter:
		(self parameterClass
			name: name
			description: description
			type: type
			required: aBoolean)