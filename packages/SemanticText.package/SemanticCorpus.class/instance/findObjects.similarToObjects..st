search
findObjects: number similarToObjects: objects

	^ self
		findObjects: number
		similarToObjects: objects
		collect: [:object | object]