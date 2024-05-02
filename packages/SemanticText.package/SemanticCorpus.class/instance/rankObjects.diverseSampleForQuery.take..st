search - ranking
rankObjects: objects diverseSampleForQuery: queryOrNil take: anInteger

	^ self
		rankObjects: objects
		sampleForQuery: queryOrNil
		diverse: true
		take: anInteger