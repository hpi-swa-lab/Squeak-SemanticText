search
findRankedObjects: number similarToObject: anObject collect: collectBlock

	^ self
		findRankedObjects: number
		similarToObjects: {anObject}
		collect: collectBlock