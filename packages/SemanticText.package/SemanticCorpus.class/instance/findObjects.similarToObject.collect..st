search
findObjects: number similarToObject: anObject collect: collectBlock

	^ self
		findObjects: number
		similarToObjects: {anObject}
		collect: collectBlock