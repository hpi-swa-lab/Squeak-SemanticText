accessing
documentsForObject: anObject

	^ self documents select: [:ea | ea object = anObject]