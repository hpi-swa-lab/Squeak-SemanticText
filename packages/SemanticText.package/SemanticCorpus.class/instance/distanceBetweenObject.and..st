search
distanceBetweenObject: object and: anotherObject

	| leftDocuments rightDocuments leftAverage rightAverage |
	self flag: #todo. "Maybe do search for each element instead of average?"
	
	leftDocuments := (self allDocumentsForObject: object) ifEmpty: [^ 1].
	rightDocuments := self allDocumentsForObject: anotherObject.
	
	#optimized.
	"leftAverage := (leftDocuments collect: [:doc | doc embedding]) average."
	leftDocuments := leftDocuments asArray.
	leftAverage := leftDocuments first embedding shallowCopy.
	2 to: leftDocuments size do: [:i |
		leftAverage += (leftDocuments at: i) embedding].
	leftAverage /= leftDocuments size.
	"rightAverage := (rightDocuments collect: [:doc | doc embedding]) average."
	rightDocuments := rightDocuments asArray.
	rightAverage := rightDocuments first embedding shallowCopy.
	2 to: rightDocuments size do: [:i |
		rightAverage += (rightDocuments at: i) embedding].
	rightAverage /= rightDocuments size.
	
	^ self distanceBetween: leftAverage and: rightAverage