accessing
peekFor: anObject

	self flag: #moveUpstream.
	self atEnd ifTrue: [^ false].
	self peek = anObject ifFalse: [^ false].
	self next.
	^ true