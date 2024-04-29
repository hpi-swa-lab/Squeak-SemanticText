accessing
activeToolSpec

	| active |
	active := self toolSpecFor: #active ifAbsent: [nil].
	^ (self defaultToolSpec ifNil: [^ active])
		updatedWith: active