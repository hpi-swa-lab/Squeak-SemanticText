search - ranking
rankObjects: objects sampleForQuery: queryOrNil take: anInteger

	^ self
		rankObjects: objects
		sampleForQuery: queryOrNil
		diverse: false
		take: anInteger