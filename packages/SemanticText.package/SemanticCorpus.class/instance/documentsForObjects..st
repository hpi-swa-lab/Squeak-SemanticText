accessing
documentsForObjects: objects

	^ self documents select: [:ea | objects includes: ea object]