search
findRankedObjects: number similarToObjects: objects

	^ self
		findRankedObjects: number
		similarToObjects: objects
		collect: [:object | object]