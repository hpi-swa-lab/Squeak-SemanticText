accessing
activeToolSpec

	^ self toolSpecFor: #active ifAbsent: [nil]