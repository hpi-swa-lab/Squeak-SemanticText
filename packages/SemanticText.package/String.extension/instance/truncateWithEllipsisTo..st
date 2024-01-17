*SemanticText-converting-pseudo-override
truncateWithEllipsisTo: maxLength
	"Return myself or a copy suitably shortened but with ellipsis added"

	^ self size <= maxLength
		ifTrue:
			[self]
		ifFalse:
			[(self copyFrom: 1 to: (maxLength - 3)), '...']


	"'truncateWithElipsisTo:' truncateWithEllipsisTo: 20"