private
makeNewEventId

	| newId prefix |
	prefix := 'sqrtevt_'.
	newId := prefix , ((existingIds count: [:ea | ea beginsWith: prefix]) + 1).
	self assert: (existingIds includes: newId) not.
	^ existingIds add: newId