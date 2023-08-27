search
findObjects: number similarToQuery: aString

	^ self
		findObjects: number
		similarToQuery: aString
		collect: [:object | object]