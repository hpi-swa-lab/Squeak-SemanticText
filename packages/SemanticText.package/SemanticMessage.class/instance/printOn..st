printing
printOn: aStream

	aStream nextPut: $[.
	self printRoleOn: aStream.
	aStream nextPut: $].
	aStream space.
	aStream print:
		(self basicContent ifNotNil: [:basicContent |
			basicContent truncateWithEllipsisTo: 80]).